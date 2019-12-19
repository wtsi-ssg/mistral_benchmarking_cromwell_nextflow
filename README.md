
# Cromwell and Nextflow File Operations Comparison using Mistral

This repository provides a detailed file operations comparison between Cromwell, Nextflow and Native GATK using Mistral (https://www.ellexus.com/products/mistral/) for HaplotypeCaller tool.

- Openstack Virtual Machine : m1.xlarge (with AVX support) (134.4GB Memory, 16 Cores)
- OS tested on : Ubuntu Bionic (18.04.2)
- GATK : v4.1 and above (https://software.broadinstitute.org/gatk/download)
	- Tool : HaplotypeCaller
- Java : OpenJDK 1.8.0_232
- Singularity : v3.4.2 (https://sylabs.io/guides/3.0/user-guide/installation)
- Cromwell : cromwell-47.jar (https://github.com/broadinstitute/cromwell/releases/tag/47)
- Nextflow : v19.10.0 (https://www.nextflow.io/docs/latest/getstarted)
- Mistral : v2.13.4_RC5_x86_64 (https://www.ellexus.com/products/mistral)
- Input Data : 
	- BAM file : HG00101_align.bam (79G)
	- Reference file : hs38DH.fa
- GATK Singularity Container (gatk.img)


## Setup
1. There were total 5 (4 workflow + 1 native gatk) runs given on 5 different m1.xlarge OpenStack hosts to be run in parallel.
2. Input data was copied to local disk of each host. 
3. Details of 5 runs :
	1. Host1 : Cromwell running GATK within a Singularity Container
	2. Host2 : Nextflow running GATK within a Singularity Container
	3. Host3 : Cromwell running GATK natively
	4. Host4 : Nextflow running GATK natively
	5. Host5 : GATK running natively
	
## How to Run
```
Please go through README.md and workflow files under each subdirectory (cromwell, nextflow, gatk).
```
## Results
```
https://github.com/wtsi-ssg/mistral_benchmarking_cromwell_nextflow/blob/master/Mistral_Cromwell_Nextflow_m1xlarge.pptx
```
