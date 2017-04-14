import numpy as np
def bestSplit(y) :
    '''
    Greedily computes the best splitting point for the current node.  
    Assumes there is at least 2 values.  There are more numerically 
    stable ways of doing this
    [see The Art of Computer Programming p. 232, Vol 2, 3rd Edition]
    @param y : array-like, shape = [n_samples,], contains the 
    output values for each sample.  Assumes the
    values are sorted by the corresponding first 
    feature values.
    @return the value i such that inputs 0,...,i belong in the 
    left subtree.
    '''
    sums = np.cumsum(y) #partial sums of y-values
    sumsq = np.cumsum([a**2 for a in y]) #partial sums of squared y-values
    S = sums[-1] #sum of all y-values
    SS = sumsq[-1] # sum of all squared y-values
    bestIdx = -1
    bestLoss = None
    N = len(y)
    for idx in range(N-1) :
        leftLoss = sumsq[idx] - sums[idx]**2/(idx+1.0)
        rightLoss = (SS-sumsq[idx])-(S-sums[idx])**2/(N-(idx+1.0)) 
        loss = leftLoss+rightLoss
        if bestIdx == -1 or loss < bestLoss :
            bestIdx = idx
            bestLoss = loss            
    return bestIdx,bestLoss

