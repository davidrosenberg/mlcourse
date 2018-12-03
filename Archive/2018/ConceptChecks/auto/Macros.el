(TeX-add-style-hook
 "Macros"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("hyperref" "plainpages=false" "colorlinks=true" "citecolor=blue" "filecolor=blue" "linkcolor=blue" "urlcolor=blue")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "amsthm"
    "amsfonts"
    "amsmath"
    "amssymb"
    "fullpage"
    "mathrsfs"
    "graphicx"
    "centernot"
    "bbm"
    "float"
    "tikz"
    "asymptote"
    "comment"
    "matlab-prettifier"
    "url"
    "hyperref"
    "pstricks"
    "multido")
   (TeX-add-symbols
    '("diaggggg" 5)
    '("diagggg" 4)
    '("diaggg" 3)
    '("diagg" 2)
    '("Diaggggg" 5)
    '("Diagggg" 4)
    '("Diaggg" 3)
    '("Diagg" 2)
    '("pMatttttt" 6)
    '("pMattttt" 5)
    '("pMatttt" 4)
    '("pMattt" 3)
    '("pMatt" 2)
    '("pMat" 1)
    '("PMatttttt" 6)
    '("PMattttt" 5)
    '("PMatttt" 4)
    '("PMattt" 3)
    '("PMatt" 2)
    '("PMat" 1)
    '("Mattt" 9)
    '("Matts" 6)
    '("MATT" 4)
    '("Matt" 4)
    '("Mas" 2)
    '("Mat" 3)
    '("Set" 2)
    '("Gen" 2)
    '("BSet" 2)
    '("BSimpList" 1)
    '("BSimpSet" 1)
    '("SimpSet" 1)
    '("Pow" 1)
    '("Mod" 1)
    '("inputX" 1)
    "Range"
    "Id"
    "E"
    "ls"
    "ridge"
    "notto"
    "Matlab"
    "Null"
    "Col"
    "Alt"
    "diam"
    "sgn"
    "rref"
    "ran"
    "Var"
    "Cov"
    "Mor"
    "Exp"
    "Top"
    "nul"
    "supp"
    "col"
    "id"
    "bd"
    "lp"
    "upto"
    "downto"
    "ind"
    "cc"
    "XX"
    "YY"
    "RR"
    "RRb"
    "RRR"
    "AAA"
    "MMM"
    "FF"
    "FFF"
    "VVV"
    "EE"
    "EEE"
    "DD"
    "QQ"
    "NQ"
    "NN"
    "NNN"
    "ZZ"
    "ZZZ"
    "CC"
    "CCC"
    "HH"
    "NNb"
    "RRc"
    "OO"
    "II"
    "JJ"
    "BB"
    "BBB"
    "TT"
    "TTT"
    "LL"
    "LLL"
    "WW"
    "UU"
    "UUU"
    "PP"
    "PPP"
    "POL"
    "GG"
    "rel"
    "Sol"
    "Not"
    "horzbar"
    "arraystretch")
   (LaTeX-add-environments
    "idea"
    "sketch"
    "Array"))
 :latex)

