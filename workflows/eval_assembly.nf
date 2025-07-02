include {merqury;
    yak_count as yak_count_mom;
    yak_count as yak_count_dad;
    yak_qv
    } from "../modules/eval_assembly.nf"

workflow eval_assembly_merqury{
    take:
    hapmers
    meryl_child_sr
    hap_mom_fasta
    hap_dad_fasta

    main:
    merqury(hapmers, meryl_child_sr, hap_mom_fasta, hap_dad_fasta)

    emit:
    result = merqury.out.result
}

workflow eval_assembly_yak{
    take:
    mom_fastq
    dad_fastq
    hap_mom_fasta
    hap_dad_fasta
    
    main:
    yak_count_mom(mom_fastq)
    yak_count_dad(dad_fastq)
    yak_qv(yak_count_mom.out.yak_file,
        yak_count_dad.out.yak_file,
        hap_mom_fasta, hap_dad_fasta
        )

    emit:
    result = yak_qv.out.result
}