# Cellranger-name-fixer
These two scripts fix gene short names in the genes.tsv file from cellranger output.  You must download both to the same directory in order for them to run, and must have R and plyr installed

to run:

from the directory where you downloaded these two scripts, run this command:

bash fixer.bash [path to genes.tsv in cellranger outs] [path to reference gtf] [output tsv path]

The script will rename the second column of the genes.tsv according to the short names in the reference gtf.  This works with flybase gtfs, please manually verify with gtfs from other sources.

Before the tool runs it copies genes.tsv into a file called genesbackup.tsv in the current directory.  If something goes wrong, just restore genes.tsv from that file.
