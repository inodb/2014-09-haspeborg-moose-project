__author__ = "inodb http://ino.pm"
__license__ = "MIT"

CONCOCT_COMMIT="https://raw.githubusercontent.com/inodb/snakemake-workflows/98f9ee1c49efe16d0fde0dc62040fe6e347b0fce/"
include: CONCOCT_COMMIT + "bio/ngs/rules/binning/concoct.rules"
include: CONCOCT_COMMIT + "common/rules/track_dir.rules"

configfile: "config.json"

rule all_cutup_10K:
    input:
        expand("concoct/{assembly}/cutup/contigs_10K.fasta", assembly=config["concoct_assemblies"])

rule track_changes:
    input:
        "concoct_track.txt"
