## How to Run

```
# For Cromwell running GATK within a Singularity Container

/home/ubuntu/mistral_2.13.4_RC5_x86_64/mistral_launch.sh \
java -jar cromwell-47.jar \
run HaplotypeCaller_singularity.wdl \
-i HaplotypeCaller_singularity.input.json 

# For Cromwell running GATK natively

/home/ubuntu/mistral_2.13.4_RC5_x86_64/mistral_launch.sh \
java -jar cromwell-47.jar \
run HaplotypeCaller.wdl \
-i HaplotypeCaller.input.json 

```
