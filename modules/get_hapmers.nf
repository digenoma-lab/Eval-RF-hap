process meryl{
    input:
    path reads
    val k
    val out_name
    output:
    path("${out_name}.count.meryl"), emit: counts_file
    script:
    if (params.debug){
        """
        echo "meryl --help" > ${out_name}.count.meryl
        """
    }
    else{
        """
        meryl threads=$task.cpus k=$k count $reads output ${out_name}.count.meryl
        """
    }
}
process hapmers{
    input:
    path dad_counts
    path mom_counts
    path child_counts
    output:
    path("hap1.only.meryl"), emit: hap_1
    path("hap2.only.meryl"), emit: hap_2
    path("shrd.meryl"), emit: shared
    script:
    if (params.debug){
        """
        echo "hapmers --help" > hap1.only.meryl
        echo "hapmers --help" > hap2.only.meryl
        echo "hapmers --help" > shrd.meryl
        """
    }
    else{
        """
        sh \$MERQURY/trio/hapmers.sh  CHI_maternal.meryl  CHI_paternal.meryl CHID_child.meryl
        """
    }
}