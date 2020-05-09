## NEED TO ADD IN BIBTEX MOVING!!!
## Run script from root of mlcourse repository .

cd ~/Dropbox/repos/mlcourse
FLATTEN="python Code/admin/flatten_lyx.py"
LYX2LYX="python /Applications/LyX.app/Contents/Resources/lyx2lyx/lyx2lyx"
YEAR="2019"
ORIGIN="." 
##ORIGIN="2017" 
DEST="Archive"/$YEAR
rm -rf $DEST
## Flatten lectures
mkdir -p $DEST/Lectures/source
find $ORIGIN/Lectures/*lyx |  parallel $FLATTEN  {} $DEST/Lectures/source

## Generate pdf files from newly flattened lyx
find $DEST/Lectures -name "*.lyx" | parallel --verbose /Applications/LyX.app/Contents/MacOS/lyx {} -e pdf2

rm -rf $DEST/Lectures/source/ML1.black-box-ML $DEST/Lectures/source/SVM $DEST/Lectures/source/bayesian-networks $DEST/Lectures/source/bloomberg-midterm-review $DEST/Lectures/source/constrained-vs-penalized $DEST/Lectures/source/convex-optimization $DEST/Lectures/source/directional-derivatives $DEST/Lectures/source/exam-recap $DEST/Lectures/source/features $DEST/Lectures/source/hard-margin-SVM $DEST/Lectures/source/kernel-methods-intro $DEST/Lectures/source/kernels-norepresenter $DEST/Lectures/source/kernels-wrapup $DEST/Lectures/source/lasso-ridge-elastic-net $DEST/Lectures/source/ml-overview $DEST/Lectures/source/sgd-gd-revisited $DEST/Lectures/source/test2-review $DEST/Lectures/source/01.black-box-ML

## Move newly generated PDF files up to the $YEAR/Lectures directory
find $ORIGIN/Lectures/*lyx | parallel mv $DEST/Lectures/source/{/.}/{/.}.pdf $DEST/Lectures/
rm $DEST/Lectures/ML1.black-box-ML.pdf $DEST/Lectures/SVM.pdf $DEST/Lectures/bayesian-networks.pdf $DEST/Lectures/bloomberg-midterm-review.pdf $DEST/Lectures/constrained-vs-penalized.pdf $DEST/Lectures/convex-optimization.pdf $DEST/Lectures/directional-derivatives.pdf $DEST/Lectures/exam-recap.pdf $DEST/Lectures/features.pdf $DEST/Lectures/hard-margin-SVM.pdf $DEST/Lectures/kernel-methods-intro.pdf $DEST/Lectures/kernels-norepresenter.pdf $DEST/Lectures/kernels-wrapup.pdf $DEST/Lectures/lasso-ridge-elastic-net.pdf $DEST/Lectures/ml-overview.pdf $DEST/Lectures/sgd-gd-revisited.pdf $DEST/Lectures/test2-review.pdf $DEST/Lectures/14c.next-steps.pdf

## Flatten Notes
#mkdir -p $YEAR/Notes/source
find $ORIGIN/Notes/*lyx |  parallel $FLATTEN  {} $DEST/Notes/source
## Generate pdf files from newly flattened lyx
find $DEST/Notes -name "*.lyx" | parallel --verbose /Applications/LyX.app/Contents/MacOS/lyx {} -e pdf2
## Move newly generated PDF files up to the $YEAR/Notes directory
find $ORIGIN/Notes/*lyx | parallel mv $DEST/Notes/source/{/.}/{/.}.pdf $DEST/Notes/

## Copy homework
rsync -av $ORIGIN/Homework $DEST/

## Copy Labs
rsync -av $ORIGIN/Labs $DEST/

## Copy Code
rsync -av Code $DEST/
rm -rf $DEST/Code/admin

## Copy Concept Checks
rsync -av ConceptChecks $DEST/

## Convert to newest LyX version
##find $DEST/Lectures -name "*.lyx" |  parallel --verbose 'echo cp {} {//}/old; '
##find $DEST/Lectures -name "*.lyx" | parallel --verbose echo mv {} {//}/old; $LYX2LYX {//}/old -o {}
##parallel --verbose /Applications/LyX.app/Contents/MacOS/lyx {} -e pdf2
##$LYX2LYX 


## In lectures.yml, search and replace:
cd ~/Dropbox/repos/ml2019/data
sed '
s_https://davidrosenberg.github.io/mlcourse/Lectures_ https://davidrosenberg.github.io/mlcourse/Archive/2019/Lectures_
s_https://davidrosenberg.github.io/mlcourse/ConceptChecks_ https://davidrosenberg.github.io/mlcourse/Archive/2019/ConceptChecks_
s_https://davidrosenberg.github.io/mlcourse/Notes_ https://davidrosenberg.github.io/mlcourse/Archive/2019/Notes_
s_https://davidrosenberg.github.io/mlcourse/Homework_ https://davidrosenberg.github.io/mlcourse/Archive/2019/Homework_
s_https://davidrosenberg.github.io/mlcourse/Labs_ https://davidrosenberg.github.io/mlcourse/Archive/2019/Labs_' <lectures.yml >tmp
mv tmp lectures.yml
rm tmp

sed 's_https://davidrosenberg.github.io/mlcourse/Homework_ https://davidrosenberg.github.io/mlcourse/Archive/2019/Homework_'
<assignments.yml >tmp
mv tmp assignments.yml
rm tmp

echo "null" > this-week.yml 

