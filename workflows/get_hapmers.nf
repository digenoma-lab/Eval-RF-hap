include { meryl as count_kmers_dad;
          meryl as count_kmers_mom;
          meryl as count_kmers_child;
          hapmers
} from '../modules/get_hapmers'

workflow get_hapmers {
    take:
    dad_short_reads
    mom_short_reads
    child_short_reads

    main:
    count_kmers_dad(dad_short_reads, 24, out_name="dad")
    count_kmers_mom(mom_short_reads, 24, out_name="mom")
    count_kmers_child(child_short_reads, 24, out_name="child")

    hapmers(count_kmers_dad.out.counts_file,
        count_kmers_mom.out.counts_file,
        count_kmers_child.out.counts_file)
    
    emit:
    hapmers_dad = hapmers.out.hap_1
    hapmers_mom = hapmers.out.hap_2
    hapmers_shared = hapmers.out.shared
}