#!/usr/bin/python
import os, sys, re, sets, shutil
usage = "usage: filename.lyx destination_path"

start_wd = os.getcwd()
## change working directory to location of lyx file, so internal
## relative references can be easily resolved
full_path_fname = os.path.realpath(sys.argv[1])
fname = os.path.basename(full_path_fname)
fname_no_extension = os.path.splitext(fname)[0]
full_path = os.path.dirname(full_path_fname)
rel_path_fname = os.path.relpath(full_path_fname, start_wd)
input = open(full_path_fname)

## Create a new folder to put new files into
rel_outpath = os.path.join(sys.argv[2], fname_no_extension)
outpath = os.path.realpath(rel_outpath)
print "Flattening ", rel_path_fname, "to",rel_outpath
try: 
    os.makedirs(outpath)
except OSError:
    if not os.path.isdir(outpath):
        raise

new_fname = os.path.join(outpath, os.path.basename(fname)) # new lyx file
output = open(new_fname, 'w')

os.chdir(full_path)
filepaths = sets.Set() # collect paths to figures
for s in input:  # for each line of input
    m = re.match(r"^\s*filename\s+(.+)", s)  #find figure references
    if m:  # if we find something
        fig_path_fname =  os.path.realpath(m.group(1))  # extract the filename itself
        filepaths.add(fig_path_fname)
        fig_fname =  os.path.basename(fig_path_fname)
        s = s.replace(m.group(1), fig_fname)
    output.write(s)

for p in filepaths:
#    print "Copying", os.path.relpath(p, start_wd), " to " , os.path.relpath(outpath,start_wd)
    shutil.copy(p, outpath)

input.close()
output.close()
