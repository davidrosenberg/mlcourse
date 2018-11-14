"""
Author: Yao Zhu
Licensed under the MIT License
https://opensource.org/licenses/MIT
Based on the code from Steven Rabanser at https://github.com/steverab/tensor-gmm/tree/master/python
"""

import numpy as np
import matplotlib.pyplot as plt

d = 10              # dimension of each data point.
k = 6               # number of components. We require k<=d
n = 1000            # same number of data points from each component.

s_true = 10          # true variance parameter, i.e., \sigma^2.

# For reproducible experiments, fix the random seed.
np.random.seed(0)

def generate_data(d, k, n):
    # Randomly generate the k mu_i's. They will be linearly independent a.s.
    # NOTE: without scaling (i.e., scale=1), the results are very bad. It might
    # require more data points, and more stable numerical implementation, more
    # power iterations. And it might be that uniform w_i is a difficult case?
    # well.
    scale = 20
    MU_true = scale*np.random.rand(d, k)
    
    tot = k * n         # total number of data points.
    
    # Generate data from k mixture of spherical Gaussians. n data points from
    # each component. Thus the true mixing weight of each component is 1/k.
    X = np.zeros((tot, d))
    for i in range(k):
        mean = np.transpose(MU_true[:, i])
        covariance = s_true * np.identity(d)
        mvn = np.random.multivariate_normal(mean, covariance, n)
        X[i*n:(i+1)*n, :] = mvn

    # Each row of X is a data point.
    return (X, MU_true)

def first_moment(X):
    tot = len(X[:,1])
    M1 = np.matmul(X.T, np.ones((tot,1)))
    M1 /= tot
    return M1

def second_moment(X):
    tot = len(X[:,1])
    E2 = np.matmul(X.T, X)
    E2 /= tot
    return E2

def estimate_variance(M1, E2):
    # Once we have M1 and E2, we can estimate the variance parameter by
    # computing the smallest eigenvalue of the empirical covariance matrix.
    covX = E2 - np.matmul(M1, M1.T)
    eigen_pair = np.linalg.eig(covX)
    # Extract the smallest eigenvalue.
    s_est = min(eigen_pair[0].tolist())

    return s_est

def perform_whitening(M2, X, k):
    # Thin eigendecomposition of M2 by thin-SVD on it. However, because M2 is
    # just and estimate, you may find that the result is not thin at all, i.e.,
    # Lambda could be of length d.
    U, Lambda, _ = np.linalg.svd(M2)
    # Use only the first k-columns of U and first k elements of Lambda to define
    # the whitening matrix.
    B = np.matmul(U[:,0:k], np.diag(np.sqrt((1/Lambda[0:k]))))
    # The right pseudo inverse of B.T.
    BT_pinv = np.matmul(U[:,0:k], np.diag(np.sqrt((Lambda[0:k]))))
    # Whiten the data matrix.
    X_whit = np.matmul(X, B)
    
    return (B, X_whit, BT_pinv)

def tensor_power_method(X_whit, B, s_est, M1):
    # Convergence tolerance of the power iteration.
    TOL = 1e-8
    # Max number of power iteration.
    maxiter = 100
    # The estimated eigenvectors of the whitened 3rd order purified moment.
    V_est = np.zeros((k, k))
    # The estimated eigenvalues of the whitened 3rd order purified moment.
    lamb_est = np.zeros((k, 1))

    tot = len(X_whit[:,1])
    for i in range(k):
        # Initial as a random vec on the unit sphere.
        v_old = np.random.rand(k, 1)
        v_old = np.divide(v_old, np.linalg.norm(v_old))
        # Run at most maxiter number of power iterations.
        for iter in range(maxiter):
            alpha = np.matmul(X_whit, v_old)
            v_new = (np.matmul(X_whit.T, alpha*alpha)) / tot
            # We need this temporary matvec.
            BT_M1 = np.matmul(B.T, M1)
            beta = np.matmul(B, v_old)
            # Note although in essence np.dot(beta.T, beta) is a scalar, it's
            # still represented as an array, thus we need another np.matmul.
            v_new -= s_est * (np.matmul(BT_M1, np.dot(beta.T, beta)))
            v_new -= s_est * (2 * np.matmul(B.T, np.matmul(np.matmul(B, v_old), np.dot(BT_M1.T, v_old) )))
            # Apply the deflation.
            if i > 0:
                for j in range(i):
                    v_new -= np.reshape(V_est[:, j] * np.power(np.dot(v_old.T, V_est[:, j]), 2) * lamb_est[j], (k,1))
            l = np.linalg.norm(v_new)
            v_new = np.divide(v_new, l)
            if np.linalg.norm(v_old - v_new) < TOL:
                V_est[:, i] = np.reshape(v_new, k)
                lamb_est[i] = l
                break
            v_old = v_new

    return (V_est, lamb_est)

def backward_transform(V_est, lamb_est, BT_pinv):
    # w_i = 1/(lamb[i]*lamb[i])
    w_est = 1 / (lamb_est*lamb_est)
    # You may find that sum(w_est) is not close to 1. Thus, a renormalization
    # might be needed.
    w_est = w_est / sum(w_est)
    MU_est = np.matmul(np.matmul(BT_pinv, V_est), np.diag(np.reshape(lamb_est, k)))
    
    return (MU_est, w_est)

def report_results(s_true, s_est, MU_true, MU_est, w_est):
    print ("The true variance parameter is: " + str(s_true))
    print ("The estimated variance parameter is: " + str(s_est))
    k = len(MU_true[1,:])
    # In order to detect the permutation to align MU_true and MU_test, compute
    # the normalized Gram matirx.
    MM_Gram = np.zeros((k,k))
    for i in range(k):
        for j in range(k):
            MM_Gram[i,j] = np.inner(MU_true[:,i], MU_est[:,j]) / (np.linalg.norm(MU_true[:,i]) * np.linalg.norm(MU_est[:,j]))
    for i in range(k):
        j = np.argmax(MM_Gram[i,:])
        print("Parameters specific to the " + str(i+1) + "-th component:")
        print("\t" + "The true      mixing weight: " + str(1.0/k))
        print("\t" + "The estimated mixing weight: " + str(w_est[j][0]))
        print("\t" + "The true      mean: " + str(MU_true[:,i].T))
        print("\t" + "The estimated mean: " + str(MU_est[:,j].T))
        

if __name__ == "__main__":
    (X, MU_true) = generate_data(d, k, n)

    # Explicitly form the first and second raw moments.
    M1 = first_moment(X)
    E2 = second_moment(X)
    
    # Estimate the variance parameter.
    s_est = estimate_variance(M1, E2)
    
    # Form the second order purified moment.
    M2 = E2 - s_est * np.identity(d)
    
    # Perform whitening.
    B, X_whit, BT_pinv = perform_whitening(M2, X, k)
    
    # Tensor power method.
    (V_est, lamb_est) = tensor_power_method(X_whit, B, s_est, M1)
    
    # Backward transform.
    MU_est, w_est = backward_transform(V_est, lamb_est, BT_pinv)
    
    # Report the results.
    report_results(s_true, s_est, MU_true, MU_est, w_est)









