__author__ = "inodb http://ino.pm"
__license__ = "MIT"

configfile: "config.json"


CONCOCT_COMMIT="https://raw.githubusercontent.com/inodb/snakemake-workflows/8494d27366395ce29b89efde23b14c7f1e0e1000/"
include: CONCOCT_COMMIT + "bio/ngs/rules/binning/concoct.rules"
include: CONCOCT_COMMIT + "common/rules/track_dir.rules"
include: CONCOCT_COMMIT + "bio/ngs/rules/mapping/bowtie2.rules"
include: CONCOCT_COMMIT + "bio/ngs/rules/mapping/samtools.rules"
include: CONCOCT_COMMIT + "bio/ngs/rules/annotation/prodigal.rules"
include: CONCOCT_COMMIT + "bio/ngs/rules/blast/rpsblast.rules"

localrules: track_changes


rule track_changes:
    input:
        "concoct_track.txt", "mapping_track.txt"
