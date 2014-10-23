__author__ = "inodb http://ino.pm"
__license__ = "MIT"

configfile: "config.json"


CONCOCT_COMMIT="https://raw.githubusercontent.com/inodb/snakemake-workflows/5c9986b87e5a140876fd2a5a7cdfb25d973ea79f/"
include: CONCOCT_COMMIT + "bio/ngs/rules/binning/concoct.rules"
include: CONCOCT_COMMIT + "common/rules/track_dir.rules"
include: CONCOCT_COMMIT + "bio/ngs/rules/mapping/bowtie2.rules"
include: CONCOCT_COMMIT + "bio/ngs/rules/mapping/samtools.rules"

localrules: track_changes


rule track_changes:
    input:
        "concoct_track.txt", "mapping_track.txt"
