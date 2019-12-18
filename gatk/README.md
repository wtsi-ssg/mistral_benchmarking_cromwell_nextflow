## How to Run

```
# VCF
/home/ubuntu/mistral_2.13.4_RC5_x86_64/mistral_launch.sh \
/home/ubuntu/gatk-4.1.4.1/gatk \
--java-options "-Dsamjdk.use_async_io_read_samtools=true -Dsamjdk.use_async_io_write_samtools=true -Dsamjdk.use_async_io_write_tribble=false" \
HaplotypeCaller \
-R /home/ubuntu/hs38DH.fa \
--pairHMM AVX_LOGLESS_CACHING_OMP \
--native-pair-hmm-threads 8 \
-I /home/ubuntu/HG00101_align.bam \
-O /home/ubuntu/HG00101.raw.indels.snps.vcf


```
