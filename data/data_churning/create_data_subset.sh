for i in *bam
do
echo $i
samtools view -b -L chr6_chr14.bed $i > "chr6_chr14_"$i
bedtools bamtofastq -i "chr6_chr14_"$i -fq "chr6_chr14_"$i".fastq"
done

#gzip *.fastq

mv chr6_chr14_GSM798440-ready.bam.fastq MCF7_input.fastq
mv chr6_chr14_GSM798423-ready.bam.fastq MCF7_ER_1.fastq
mv chr6_chr14_GSM798424-ready.bam.fastq MCF7_ER_2.fastq
mv chr6_chr14_GSM798436-ready.bam.fastq MCF7_FOXA1_1.fastq
mv chr6_chr14_GSM798437-ready.bam.fastq MCF7_FOXA1_2.fastq






