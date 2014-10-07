Metagenomics Analysis
===========================
This is a repository to reconstruct the analysis done for a metagenomics
project. Only the rules to do the analysis are stored, since the actual data is
too big to store online. One can however see which files have been changed by
having a look at how the ``*_track.txt`` files have changed over the various
commits.

# Install Snakemake
Snakemake has been used to make the analysis reproducible. Snakemake uses
python3. A common approach for handling Python scripts is to create a virtual
environment for each of them so your modules of different python scripts do not
interfer with each other. Here we use 
[conda](https://store.continuum.io/cshop/anaconda/) to install snakemake:

```shell
conda create -n py3-snakemake python=3 anaconda
source activate py3-snakemake
pip install snakemake
```

You can deactivate the environment again with:

```shell
source deactivate
```

# Clustering metagenomic assemblies with CONCOCT
The idea is to cluster metagenomic assemblies of six related samples that we
have into bins using (CONCOCT)[https://github.com/BinPro/CONCOCT]. For this we
follow the (complete
example)[https://concoct.readthedocs.org/en/latest/complete_example.html].

## Cutting up contigs
The assemblies have already been done, so they have been put in the
[config.json](config.json) file. All the rules to do the analysis are in the
[Snakefile](Snakefile]. Start by cutting up the contigs into chunks of 10K:

```shell
snakemake --cores 6 -p all_cutup_10K
```
This results in:
```shell
$ ls concoct/*/cutup/contigs_10K.fasta
concoct/101B/cutup/contigs_10K.fasta  concoct/103/cutup/contigs_10K.fasta  concoct/105/cutup/contigs_10K.fasta
concoct/102/cutup/contigs_10K.fasta   concoct/104/cutup/contigs_10K.fasta  concoct/106/cutup/contigs_10K.fasta
```
