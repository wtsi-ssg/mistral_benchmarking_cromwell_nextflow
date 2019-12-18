params.input_bam = "/home/ubuntu/HG00101_align.bam"
params.input_bam_index = "/home/ubuntu/HG00101_align.bam.bai"
params.ref_fasta = "/home/ubuntu/hs38DH.fa"
params.ref_fasta_index = "/home/ubuntu/hs38DH.fa.fai"
params.ref_dict = "/home/ubuntu/hs38DH.dict"
params.sampleName = "HG00101"

input_bam_file = file(params.input_bam)
input_bam_index_file = file(params.input_bam_index)
ref_fasta_file = file(params.ref_fasta)
ref_fasta_index_file = file(params.ref_fasta_index)
ref_dict_file = file(params.ref_dict)
gatk_path = "/home/ubuntu/gatk-4.1.4.1/gatk"

process 'HaplotypeCaller' {
    input:
        file ref_fasta from ref_fasta_file
        file ref_fasta_index from ref_fasta_index_file
        file ref_dict from ref_dict_file
        file input_bam from input_bam_file
        file input_bam_index from input_bam_index_file

    output:
        set file("${params.sampleName}.raw.indels.snps.vcf"), file("${params.sampleName}.raw.indels.snps.g.vcf") into haplot_ch

    script:
    """
        ${gatk_path} --java-options "-Dsamjdk.use_async_io_read_samtools=true -Dsamjdk.use_async_io_write_samtools=true -Dsamjdk.use_async_io_write_tribble=false" HaplotypeCaller -R $ref_fasta --pairHMM AVX_LOGLESS_CACHING_OMP --native-pair-hmm-threads 8 -I $input_bam -O ${params.sampleName}.raw.indels.snps.vcf

        ${gatk_path} --java-options "-Dsamjdk.use_async_io_read_samtools=true -Dsamjdk.use_async_io_write_samtools=true -Dsamjdk.use_async_io_write_tribble=false" HaplotypeCaller -ERC GVCF -R $ref_fasta --pairHMM AVX_LOGLESS_CACHING_OMP --native-pair-hmm-threads 8 -I $input_bam -O ${params.sampleName}.raw.indels.snps.g.vcf
    """
}
