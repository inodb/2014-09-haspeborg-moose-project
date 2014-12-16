__author__ = "inodb http://ino.pm"
__license__ = "MIT"

configfile: "config.json"

# add all reads to check fastqc
import os

config["fastqc_rules"]["reads"] = {os.path.basename(p):p for p in [v for t in config["bowtie2_rules"]["units"].values() for v in t]}


CONCOCT_COMMIT="https://raw.githubusercontent.com/inodb/snakemake-workflows/e1c376a46db8d88cd73fd10b00a152fa59c113db/"
include: CONCOCT_COMMIT + "bio/ngs/rules/binning/concoct.rules"
include: CONCOCT_COMMIT + "common/rules/track_dir.rules"
include: CONCOCT_COMMIT + "bio/ngs/rules/mapping/bowtie2.rules"
include: CONCOCT_COMMIT + "bio/ngs/rules/mapping/samtools.rules"
include: CONCOCT_COMMIT + "bio/ngs/rules/annotation/prodigal.rules"
include: CONCOCT_COMMIT + "bio/ngs/rules/blast/rpsblast.rules"
include: CONCOCT_COMMIT + "bio/ngs/rules/quality_control/fastqc.rules"

localrules: track_changes


rule track_changes:
    input:
        "fastqc_track.txt", "concoct_track.txt", "mapping_track.txt", "annotation_track.txt", "blast_track.txt"
