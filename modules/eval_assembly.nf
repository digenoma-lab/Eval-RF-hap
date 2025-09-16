process merqury{
    publishDir "$params.outdir/merqury/", mode: "copy"
    input:
    tuple path(hapmers_dad), path(hapmers_mom)
    path(meryl_child_sr)
    path(hap_mom_fastq)
    path(hap_dad_fastq)
    output:
    path("merqury_result*"), emit: result
    script:
    if (params.debug){
        """
        echo "merqury_result	1	1	1	1	1	1	1	1	0.1%" > merqury_result.hap_A_merged.100_20000.phased_block.stats
        echo "merqury_result	1	1	1	1	1	1	1	1	0.1%" > merqury_result.hap_B_merged.100_20000.phased_block.stats
        """
    }
    else{
        """
        #export MERQURY=/opt/conda/share/merqury
        \$MERQURY/merqury.sh ${meryl_child_sr} ${hapmers_mom} ${hapmers_dad} ${hap_mom_fastq} ${hap_dad_fastq} merqury_result OMP_NUM_THREADS=$task.cpus
        """
    }
}
process yak_count{
    input:
    tuple path(reads_R1), path(reads_R2)
    output:
    path("${reads_R1.baseName}.yak"), emit: yak_file
    script:
    if (params.debug){
        """
        echo "yak count -o ${reads_R1.baseName}.yak ${reads_R1} ${reads_R1}" > "${reads_R1.baseName}.yak"
        """
    }
    else{
        """
        yak count -o ${reads_R1.baseName}.yak ${reads_R1} ${reads_R1}
        """
    }
}
process yak_trioeval{
    publishDir "$params.outdir/yak/", mode: "copy"
    input:
    path(mom_yak)
    path(dad_yak)
    path(child_assembly)
    output:
    path("${child_assembly}_yak.eval.txt"), emit: result
    script:
    if (params.debug){
        """
        echo "yak trioeval -t $task.cpus  ${mom_yak} ${dad_yak} ${child_assembly} > ${child_assembly}_yak.eval.txt" > ${child_assembly}_yak.eval.txt
        """
    }
    else{
        """
        yak trioeval -t $task.cpus  ${mom_yak} ${dad_yak} ${child_assembly} > ${child_assembly}_yak.eval.txt
        """
    }
}

process gfastats{
    
    publishDir "$params.outdir/gfastats/", mode: "copy"
    
    input:
    path(gfastats_noseq_hapA)
    path(gfastats_noseq_hapB)

    output:
    path("hapA.gfastats") , emit : hapA_gfastats
    path("hapB.gfastats") , emit : hapB_gfastats
    

    script:
    if (params.debug){
        """
        echo "gfastats --discover-paths ${gfastats_noseq_hapA}" >  hapA.gfastats
        echo "gfastats --discover-paths ${gfastats_noseq_hapB}" >  hapB.gfastats
        """
    }
    else{
        """
        gfastats --discover-paths ${gfastats_noseq_hapA} >  hapA.gfastats
        gfastats --discover-paths ${gfastats_noseq_hapB} >  hapB.gfastats
        """
    }

}

process extract_table{
    publishDir "$params.outdir/table/", mode: "copy"

    input:
    path(hapA_gfastats)
    path(hapB_gfastats)


    output:
    path("phasing_stats.tsv"), emit : final_table

    script:
    if (params.debug){
        """
        echo "Assembly  N50gfastats N50merqury  SwitchErrorMerqury  SwitchErrorYak  AvgBlockSize" >  phasing_stats.tsv
        echo "hapA  1   1   1   1   1   1" >> phasing_stats.tsv
        """
    }
    else{
        """
        echo "Assembly  N50gfastats N50merqury  SwitchErrorMerqury  SwitchErrorYak  AvgBlockSize" >  phasing_stats.tsv 
        grep "Scaffold N50" ${hapA_gfastats}  | awk 'BEGIN{FS=": "}{print "{$hapA_gfastats.basename}\t"\$2}'
        """
    }


}