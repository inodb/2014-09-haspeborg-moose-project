__author__ = "inodb http://ino.pm"
__license__ = "MIT"

configfile: "config.json"

# add 10K cutup as references for bowtie2 to map against
config["bowtie2_rules"]["references"] = {a + "_10K": "concoct/{a}/cutup/contigs_10K.fasta".format(a=a) for a in config["concoct_rules"]["assemblies"]}

#CONCOCT_COMMIT="https://raw.githubusercontent.com/inodb/snakemake-workflows/98f9ee1c49efe16d0fde0dc62040fe6e347b0fce/"
CONCOCT_COMMIT = "/glob/inod/github/snakemake-workflows/"
include: CONCOCT_COMMIT + "bio/ngs/rules/binning/concoct.rules"
include: CONCOCT_COMMIT + "common/rules/track_dir.rules"
include: CONCOCT_COMMIT + "bio/ngs/rules/mapping/bowtie2.rules"
include: CONCOCT_COMMIT + "bio/ngs/rules/mapping/samtools.rules"

localrules: all_cutup_10K, track_changes, all_map_10K


rule all_cutup_10K:
    input:
        expand("concoct/{assembly}/cutup/contigs_10K.fasta", assembly=config["concoct_rules"]["assemblies"])


rule all_map_10K:
    input:
        expand("mapping/bowtie2/{mapping_params}/{assembly}/samples/{sample}.sorted.removeduplicates.bam",
               assembly=config["bowtie2_rules"]["references"],
               sample=config["bowtie2_rules"]["samples"],
               mapping_params="very-fast")


rule track_changes:
    input:
        "concoct_track.txt"
