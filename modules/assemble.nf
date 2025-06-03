
process seqtk{
  input:
  path(hap)
  path(fastq)
  output:
  path("${hap.baseName}.fq.gz"), emit: fastq
  script:
  if (params.debug){
    """
    echo seqtk > ${hap.baseName}.fq.gz
    """
  }
  else{
    """
    seqtk subseq ${fastq} ${hap} | pigz -p $task.cpus  >  ${hap.baseName}.fq.gz
    """
  }
}

process hifiasm {
    input:
    path hap_i_fastq
    path hap_U_fastq
    output:
    path "${hap_i_fastq.baseName}_merged.fasta", emit: hap_merged
    script:
    if(params.debug){
    """
    echo "merged ${hap_i_fastq.baseName} + U" > "${hap_i_fastq.baseName}_merged.fasta"
    """
    }
    else{
    """
    hifiasm -o ${hap_i_fastq.baseName}_merged.ont -l 3 --ont ${hap_i_fastq} ${hap_U_fastq} -t $task.cpus
    gfatools gfa2fa ${hap_i_fastq.baseName}_merged.ont.bp.hap1.p_ctg.gfa > ${hap_i_fastq.baseName}_merged.fasta
    """
    }
}
