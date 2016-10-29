## NEED TO ADD IN BIBTEX MOVING!!!
## Run script from root of mlcourse repository .

cd ~/Dropbox/repos/mlcourse
FLATTEN="python Code/admin/flatten_lyx.py"
LYX2LYX="python /Applications/LyX.app/Contents/Resources/lyx2lyx/lyx2lyx"
YEAR=2015
ORIGIN="." 
ORIGIN="2015" 
DEST="Archive"/$YEAR
rm -rf $DEST
## Flatten lectures
mkdir -p $DEST/Lectures/source
find $ORIGIN/Lectures/*lyx |  parallel $FLATTEN  {} $DEST/Lectures/source

## Generate pdf files from newly flattened lyx
find $DEST/Lectures -name "*.lyx" | parallel --verbose /Applications/LyX.app/Contents/MacOS/lyx {} -e pdf2
## Move newly generated PDF files up to the $YEAR/Lectures directory
find $ORIGIN/Lectures/*lyx | parallel mv $DEST/Lectures/source/{/.}/{/.}.pdf $DEST/Lectures/

## Flatten Notes
#mkdir -p $YEAR/Notes/source
find $ORIGIN/Notes/*lyx |  parallel $FLATTEN  {} $DEST/Notes/source
## Generate pdf files from newly flattened lyx
find $DEST/Notes -name "*.lyx" | parallel --verbose /Applications/LyX.app/Contents/MacOS/lyx {} -e pdf2
## Move newly generated PDF files up to the $YEAR/Notes directory
find $ORIGIN/Notes/*lyx | parallel mv $DEST/Notes/source/{/.}/{/.}.pdf $DEST/Notes/



## Copy homework
rsync -av Homework $YEAR/

## Copy Labs
rsync -av Labs $YEAR/

## Copy Code
rsync -av Code $YEAR/
rm -rf $YEAR/Code/admin


## Convert to newest LyX version
##find $DEST/Lectures -name "*.lyx" |  parallel --verbose 'echo cp {} {//}/old; '
##find $DEST/Lectures -name "*.lyx" | parallel --verbose echo mv {} {//}/old; $LYX2LYX {//}/old -o {}
##parallel --verbose /Applications/LyX.app/Contents/MacOS/lyx {} -e pdf2
##$LYX2LYX 
