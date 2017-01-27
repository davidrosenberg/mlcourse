import sys
import os
from subprocess import call

def main():
    if len(sys.argv) < 1 :
        print("usage: executable option filenames..")
        sys.exit(1)
    for i in xrange(3,len(sys.argv)) :
        if call([sys.argv[1],sys.argv[2],sys.argv[i]],stdout=sys.stdout,stderr=sys.stderr) != 0 :
            sys.exit(1)

if __name__ == "__main__":
    main()
