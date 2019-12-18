# HaplotypeCaller Workflow 
workflow HaplotypeCallerGvcf_GATK4 {
  File input_bam
  File ref_fasta
  File ref_fasta_index 
  File ref_dict
  File input_bam_index

  String gatk_path = "/home/ubuntu/gatk-4.1.4.1/gatk"
  String sampleName

  call HaplotypeCaller {
      input:
        input_bam = input_bam,
        ref_fasta = ref_fasta,
        ref_fasta_index = ref_fasta_index,
        ref_dict = ref_dict,
        input_bam_index = input_bam_index,
        gatk_path = gatk_path,
        sampleName = sampleName
  }
}

# HaplotypeCaller Task
task HaplotypeCaller {
  File input_bam
  File ref_fasta
  File ref_fasta_index
  File ref_dict
  File input_bam_index
 
  String sampleName
  String gatk_path
  String? java_options
  String java_opt = select_first([java_options, "-XX:GCTimeLimit=50 -XX:GCHeapFreeLimit=10"])

  # Runtime parameters
  Int? mem_gb
  Int machine_mem_gb = select_first([mem_gb, 15])
  Int command_mem_gb = machine_mem_gb - 1

  command <<<
 
    ${gatk_path} --java-options "-Dsamjdk.use_async_io_read_samtools=true -Dsamjdk.use_async_io_write_samtools=true -Dsamjdk.use_async_io_write_tribble=false -Xmx${command_mem_gb}G ${java_opt}" \
      HaplotypeCaller \
      -R ${ref_fasta} \
      --pairHMM AVX_LOGLESS_CACHING_OMP \
      --native-pair-hmm-threads 8 \
      -I ${input_bam} \
      -O ${sampleName}.raw.indels.snps.vcf ;
    
    ${gatk_path} --java-options "-Dsamjdk.use_async_io_read_samtools=true -Dsamjdk.use_async_io_write_samtools=true -Dsamjdk.use_async_io_write_tribble=false -Xmx${command_mem_gb}G ${java_opt}" \
      HaplotypeCaller \
      -ERC GVCF \
      -R ${ref_fasta} \
      --pairHMM AVX_LOGLESS_CACHING_OMP \
      --native-pair-hmm-threads 8 \
      -I ${input_bam} \
      -O ${sampleName}.raw.indels.snps.g.vcf \
  >>>

  output {
    File rawVCF = "${sampleName}.raw.indels.snps.vcf"
    File rawGVCF = "${sampleName}.raw.indels.snps.g.vcf"
  }
}
