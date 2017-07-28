## Split weeks into train / test
weeks = cnts[, sort(unique(week))]
fracWeeksForTraining = 0.5
trainWeeks = weeks[1]:quantile(weeks,probs=fracWeeksForTraining)
testWeeks = setdiff(weeks,trainWeeks)

