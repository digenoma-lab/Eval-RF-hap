# Eval-RF-hap

**Eval-RF-hap** is a [Nextflow](https://www.nextflow.io/) pipeline designed to evaluate the haplotyping performance of [RFhap](https://github.com/digenoma-lab/rfhap) (or whatever other model to separate haplotypes), using sequencing data from a family trio (father, mother, and child). The pipeline focuses on assessing phasing accuracy using both long-read and short-read data.

This project is maintained by the [DiGenoma Lab](https://github.com/digenoma-lab).

---

## Features

- Designed for trio-based haplotyping evaluation
- Compatible with short-read (Illumina) and long-read (Oxford Nanopore, PacBio) data
- Modular, reproducible, and customizable via Nextflow
- Outputs haplotype metrics, summary reports, and visualizations

---

## Repository Structure

```bash
Eval-RF-hap/
├── data/              # Input data examples or symlinks
├── modules/           # Nextflow modules (individual analysis tasks)
├── workflows/         # Assembled Nextflow workflows
├── main.nf            # Main pipeline script
├── params.yml         # Input file paths and parameters
├── nextflow.config    # Execution settings and environment configuration
├── LICENSE
└── README.md
```

---

## Installation

Ensure you have [Nextflow](https://www.nextflow.io/docs/latest/getstarted.html) installed.

Clone this repository:

```bash
git clone https://github.com/digenoma-lab/Eval-RF-hap.git
cd Eval-RF-hap
```

---

## Running the Pipeline

1. Configure your `params.yml` file with the correct file paths and parameters.
2. Run the pipeline:

```bash
nextflow run main.nf -params-file params.yml -c nextflow.config 
```

---

## Output

The pipeline produces:

- Haplotyping metrics and error rates
- Phasing comparison between trio members
- Summary reports
- Visual plots (e.g. phasing blocks, read consistency)

Output file structure and formats depend on the modules executed.

---

## Notes

- This pipeline is tailored for a specific Chilean trio dataset but can be adapted to others.
- Make sure to install required tools or set up containerized environments (e.g. Docker or Singularity).
- Contributions and issues are welcome.

---

## License

This project is licensed under the MIT License.

---

## Citation & Acknowledgements

If you use this pipeline or parts of it in your research, please cite the DiGenoma Lab and the [RFhap project](https://github.com/digenoma-lab/RFhap).
