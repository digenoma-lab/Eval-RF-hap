include { get_hapmers } from './workflows/get_hapmers'
workflow  {
    dad_sr = Channel.value(file(params.dad_short_reads))
    mom_sr = Channel.value(file(params.mom_short_reads))
    child_sr = Channel.value(file(params.child_short_reads))

    get_hapmers(dad_sr, mom_sr, child_sr)

}