import numpy as np

X_orig = np.random.normal(0,1,(100,2))
eps = .1
mixing_matrix = np.transpose( np.array([[1,0 ],[np.sqrt(1-eps*eps), eps]]) )
X_mixed = np.dot( X_orig, mixing_matrix)
w_true_orig = np.array([1,1])
y = np.dot(X_orig, w_true_orig)
w_true_mixed = np.dot(np.linalg.inv(mixing_matrix), w_true_orig)
y_again = np.dot(X_mixed, w_true_mixed)
print np.allclose(y, y_again)  # Should be true





w_true_transformed = 
np.corrcoef(X_orig, rowvar=False)[0,1]
np.corrcoef(X_mixed, rowvar=False)[0,1]

y = 

from sklearn import linear_model
reg = linear_model.Ridge (alpha = .5)



reg.fit ([[0, 0], [0, 0], [1, 1]], [0, .1, 1]) 


reg.coef_

reg.intercept_ 
