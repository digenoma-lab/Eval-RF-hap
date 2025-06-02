# Eval-RF-hap
Nextflow pipeline to evaluate RFhap results


# Chilean Trio files for meryl databases
```
father = CHI_paternal_1.fq.gz CHI_paternal_2.fq.gz --> /mnt/beegfs/labs/DiGenomaLab/CANCER/GALLBADDER/data/CHILEAN/WGS/reseq/LG3_CHIA_*.fq.gz

mother = CHI_maternal_1.fq.gz CHI_maternal_2.fq.gz --> /mnt/beegfs/labs/DiGenomaLab/CANCER/GALLBADDER/data/CHILEAN/WGS/Rawdata2/LG2_CHIC_1.fq.gz 

child_chid = /mnt/beegfs/labs/DiGenomaLab/Chilean_ref/SeqUOH/basecalling/fastq/CHID.NANO_08*.fastq.gz

child_chip = /mnt/beegfs/labs/DiGenomaLab/Chilean_ref/SeqUOH/basecalling/fastq/CHIP.NANO_090*.fastq.gz 
```

# CHI primary meryl databases
### COMMANDS
```
slurm_script_primary_meryl_example = /mnt/beegfs/labs/DiGenomaLab/Chilean_ref/analysis/assembly/hifiasm/trios/merqury_eval/meryl_dbs/CHID_CHILD_meryl/run_slurm_meryl.sh

micromamba activate merqury
meryl threads=60 k=21 count *fastq.gz(or fq.gz) output $databse_name.meryl

```
**EACH MERYL FOLDER HAS THEIR OWN SLURM SCRIPT**

### Databases Paths
```
father = /mnt/beegfs/home/dgonzalez/DiGenomaLab/Chilean_ref/analysis/assembly/hifiasm/trios/merqury_eval/meryl_dbs/CHI_paternal_meryl/CHI_paternal.meryl

mother = /mnt/beegfs/home/dgonzalez/DiGenomaLab/Chilean_ref/analysis/assembly/hifiasm/trios/merqury_eval/meryl_dbs/CHI_maternal_meryl/CHI_maternal.meryl

chid = /mnt/beegfs/home/dgonzalez/DiGenomaLab/Chilean_ref/analysis/assembly/hifiasm/trios/merqury_eval/meryl_dbs/CHID_CHILD_meryl/CHID_child.meryl

chip = /mnt/beegfs/home/dgonzalez/DiGenomaLab/Chilean_ref/analysis/assembly/hifiasm/trios/merqury_eval/meryl_dbs/CHIP_CHILD_meryl/CHIP_child.meryl

```

# CHILEAN TRIOS HAPMERS
### COMMANDS
```
slurm_script_hapmers_example = /mnt/beegfs/labs/DiGenomaLab/Chilean_ref/analysis/assembly/hifiasm/trios/merqury_eval/meryl_dbs/hapmers/hapmers_CHID/run_slurm_hapmers.sh

micromamba activate merqury
sh $MERQURY/trio/hapmers.sh  CHI_maternal.meryl  CHI_paternal.meryl CHID_child.meryl(or CHIP_child)
```
**EACH HAPMER FOLDER HAS THEIR OWN SLURM MERQURY SCRIPT**

### PATHS for hapmers databases
```
chid = /mnt/beegfs/home/dgonzalez/DiGenomaLab/Chilean_ref/analysis/assembly/hifiasm/trios/merqury_eval/meryl_dbs/hapmers/hapmers_CHID

chip = /mnt/beegfs/home/dgonzalez/DiGenomaLab/Chilean_ref/analysis/assembly/hifiasm/trios/merqury_eval/meryl_dbs/hapmers/hapmers_CHIP
```
**In each hapmer folder the .hapmer.meryl paternal databases are used for merqury evaluation**

# Assemblies to evaluate
```
CHID.lfc4.hapA.bp.p_ctg.fa CHID.lfc4.hapB.bp.p_ctg.fa 

CHID.lfc4.hapA.bp.p_scf.fa CHID.lfc4.hapB.bp.p_scf.fa

CHIP.hapA.bp.p_ctg.fa CHIP.hapB.bp.p_ctg.fa

CHIP.hapA.bp.p_scf.fa CHIP.hapB.bp.p_scf.fa

hifiasm.trio.hap1.fa hifiasm.trio.hap2.fa

hifiasm.rfhap.hap1.lfc4.fa hifiasm.rfhap.hap2.lfc4.fa

hifiasm.rfhap.hap1.lfc3.fa hifiasm.rfhap.hap2.lfc3.fa 
```

# MERQURY EVALUATION RESULTS

### COMMANDS
```
slurm_script_merqury_example = /mnt/beegfs/labs/DiGenomaLab/Chilean_ref/analysis/assembly/hifiasm/trios/merqury_eval/meryl_dbs/hapmers/hapmers_CHID/run_slurm_merqury.sh

micromamba activate merqury

$MERQURY/merqury.sh CHID_child.meryl(or CHIP_child)  CHI_maternal.hapmer.meryl CHI_paternal.hapmer.meryl assembly_mom.fasta assembly_dad.fasta out OMP_NUM_THREADS=80 
```

### Results Folder
```
chid_assemblies = /mnt/beegfs/home/dgonzalez/DiGenomaLab/Chilean_ref/analysis/assembly/hifiasm/trios/merqury_eval/meryl_dbs/hapmers/hapmers_CHID/results

chip_assemblies = /mnt/beegfs/home/dgonzalez/DiGenomaLab/Chilean_ref/analysis/assembly/hifiasm/trios/merqury_eval/meryl_dbs/hapmers/hapmers_CHIP/results
```
***EACH RESULT FOLDER HAS THEIR OWN SLURM MERQURY SCRIPT AND CORRESPONDING LOGS FOLDERS***

# HG002
## Assemblies
```
RFHAP Version 2:
/mnt/beegfs/labs/DiGenomaLab/Chilean_ref/analysis/assembly/hifiasm/trios/HG002/hg002hapV2/hg002.hifiasm.hapA.ont.bp.p_ctg.fa
/mnt/beegfs/labs/DiGenomaLab/Chilean_ref/analysis/assembly/hifiasm/trios/HG002/hg002hapV2/hg002.hifiasm.hapB.ont.bp.p_ctg.fa

RFHAP Version 1:
/mnt/beegfs/labs/DiGenomaLab/rfhap/latest/hg002-Nov/results-leftraru/hifiasm/results/hg002.hifiasm.hapA.ont.bp.p_ctg.fa.gz
/mnt/beegfs/labs/DiGenomaLab/rfhap/latest/hg002-Nov/results-leftraru/hifiasm/results/hg002.hifiasm.hapB.ont.bp.p_ctg.fa.gz
```
## Parents and CHILD trio reads files
```
father = /mnt/beegfs/home/dgonzalez/DiGenomaLab/rfhap/data/parental_files/father/fastq
mother = /mnt/beegfs/home/dgonzalez/DiGenomaLab/rfhap/data/parental_files/mother/fastq
child = /mnt/beegfs/home/dgonzalez/DiGenomaLab/Chilean_ref/analysis/assembly/hifiasm/trios/merqury_eval/meryl_dbs/HG002_child (CHECK DOWNLOADS LINKS FOR READS)
```

## COMMANDS
### Primary meryl dbs (you can find slurm scripts in every result dbs folder)
```
meryl threads=80 k=21 count /mnt/beegfs/labs/DiGenomaLab/rfhap/data/parental_files/father/fastq/*.fastq.gz  output HG002_dad.meryl

meryl threads=80 k=21 count /mnt/beegfs/labs/DiGenomaLab/rfhap/data/parental_files/mother/fastq/*.fastq.gz  output HG002_mom.meryl

meryl threads=30 k=21 count *fastq.gz output child_HG002_ILL.meryl
```

### Primary Meryl dbs paths
```
hg002_father=/mnt/beegfs/home/dgonzalez/DiGenomaLab/Chilean_ref/analysis/assembly/hifiasm/trios/merqury_eval/meryl_dbs/HG002_dad/HG002_dad.meryl

hg002_mother=/mnt/beegfs/home/dgonzalez/DiGenomaLab/Chilean_ref/analysis/assembly/hifiasm/trios/merqury_eval/meryl_dbs/HG002_mom/HG002_mom.meryl

hg002_child=/mnt/beegfs/home/dgonzalez/DiGenomaLab/Chilean_ref/analysis/assembly/hifiasm/trios/merqury_eval/meryl_dbs/HG002_child/HG002_child.meryl
```
### Hapmers Meryl dbs
```
sh $MERQURY/trio/hapmers.sh  HG002_mom.meryl  HG002_dad.meryl HG002_child.meryl
```
### PATHS for hapmers databases
**each folder has their own slurm script for hapmer databases building**

```
mother = /mnt/beegfs/home/dgonzalez/DiGenomaLab/Chilean_ref/analysis/assembly/hifiasm/trios/merqury_eval/meryl_dbs/hapmers/hapmers_hg002.hifiasm/HG002_mom.hapmer.meryl

father = /mnt/beegfs/home/dgonzalez/DiGenomaLab/Chilean_ref/analysis/assembly/hifiasm/trios/merqury_eval/meryl_dbs/hapmers/hapmers_hg002.hifiasm/HG002_dad.hapmer.meryl
```

# MERQURY EVALUATION RESULTS
## COMMANDS FOR RFHAP V1
```
micromamba activate merqury
$MERQURY/merqury.sh HG002_child.meryl  HG002_mom.hapmer.meryl HG002_dad.hapmer.meryl hg002.hifiasm.hapA.ont.bp.p_ctg.fasta hg002.hifiasm.hapB.ont.bp.p_ctg.fasta  out OMP_NUM_THREADS=80
```
## RESULTS RFHAP V1
```
result=/mnt/beegfs/home/dgonzalez/DiGenomaLab/Chilean_ref/analysis/assembly/hifiasm/trios/merqury_eval/meryl_dbs/hapmers/hapmers_hg002.hifiasm/results/hg002.hifiasm.v1
```
## COMMANDS FOR RFHAP V1
```
micromamba activate merqury
$MERQURY/merqury.sh HG002_child.meryl  HG002_mom.hapmer.meryl HG002_dad.hapmer.meryl hg002.hifiasm.hapA.ont.bp.p_ctg.fasta  hg002.hifiasm.hapB.ont.bp.p_ctg.fasta out OMP_NUM_THREADS=80
```
## RESULTS RFHAP V2
```
result = /mnt/beegfs/home/dgonzalez/DiGenomaLab/Chilean_ref/analysis/assembly/hifiasm/trios/merqury_eval/meryl_dbs/hapmers/hapmers_hg002.hifiasm/results/hg002.hifiasm.v2 
```

## OLD HG002 MERQURY EVALUATION FOR COMPARISON

results = /mnt/beegfs/home/dgonzalez/DiGenomaLab/Chilean_ref/analysis/assembly/hifiasm/trios/merqury_eval/meryl_dbs/hapmers/hapmers_hg002.hifiasm/results/old_evaluation




