## How to Run


```
# For Nextflow running GATK within a Singularity Container

/home/ubuntu/mistral_2.13.4_RC5_x86_64/mistral_launch.sh \
nextflow \
run HaplotypeCaller_singularity.nf \
-c nextflow_singularity.conf


# For Nextflow running GATK natively

/home/ubuntu/mistral_2.13.4_RC5_x86_64/mistral_launch.sh \
nextflow \
run HaplotypeCaller.nf 

```
