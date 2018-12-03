# Homework Guide

## Generate PDF files from IPython Notebooks

1. Install the necessary packages:

*On Ubuntu*

```bash
sudo apt-get install texlive texlive-latex-extra texlive-xetex pandoc
```

2. Set the appropriate flags in your notebook:

```python
import matplotlib.pyplot as plt
%matplotlib inline
from IPython.display import set_matplotlib_formats
set_matplotlib_formats('png', 'pdf')

# optional, but suppressing warnings makes for a cleaner output
import warnings
warnings.filterwarnings('ignore')
```

3. Run the shell script `notebook_to_pdf` (located in this folder):

*Note: If you are using conda or a virtualenv, make sure to source that environment before running this command*

```bash
./notebook_to_pdf PATH/TO/<NOTEBOOK_NAME>.ipynb
```

You should see the file `<NOTEBOOK_NAME>.pdf` alongside your notebook!
