library(xtable)
library(data.table)
library(ROCR)

Fbeta <- function(p, r, B) {
  (1+B^2) * p * r  / (B^2 * p + r)
}


data(ROCR.simple)
pred <- prediction(ROCR.simple$predictions, ROCR.simple$labels)
perf <- performance(pred,"tpr","fpr")
plot(perf,colorize=TRUE)

perf <- performance(pred,"prec","rec")
plot(perf,colorize=TRUE)


prf1 = data.table(precision = c(.01,.2,.4,.6,.9), recall=c(.99,.80, .9,.62, .95) )
prf1[, F1 := round(2 * precision * recall / (precision + recall),2)]
prf1[, F05 := round(Fbeta(precision, recall, 0.5),2)]
prf1[, F2 := round(Fbeta(precision, recall, 2),2)]
prf1
xtable(prf1)

## Make fake SVM score function and class labels
svmpred = data.table(score = runif(15,-5,5))
svmpred = data.table(score = runif(12,-5,5))
svmpred[, prob := 1/(1+exp(-score))]
svmpred[, label01 := rbinom(.N, 1, prob)]
svmpred[, label := ifelse(label01==0, "-", "+")]
svmpred[, pred := ifelse(score>0,"+","-")]
svmpred = svmpred[order(score)]
svmpred
xtable(svmpred[,list(score,label,pred)])

Fbeta(6/8,1,1)
Fbeta(4/6,1,1)
