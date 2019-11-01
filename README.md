# Cellranger-name-fixer
These two scripts fix gene short names in the genes.tsv file from cellranger output.  You must download both to the same directory in order for them to run, and must have R and plyr installed

to run:

from the directory where you downloaded these two scripts, run this command:
bash fixer.bash [path to genes.tsv] [path to reference gtf]

The script will rename the second column of the genes.tsv according to the short names in the reference gtf.  This works with flybase gtfs, please manually verify with gtfs from other sources.
