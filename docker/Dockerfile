FROM ubuntu:18.04
MAINTAINER Mark Dunning<m.j.dunning@sheffield.ac.uk>
# Do not exclude man pages & other documentation
RUN rm /etc/dpkg/dpkg.cfg.d/excludes
# Reinstall all currently installed packages in order to get the man pages back
RUN apt-get update && \
    dpkg -l | grep ^ii | cut -d' ' -f3 | xargs apt-get install -y --reinstall && \
    rm -r /var/lib/apt/lists/*
RUN apt-get update 
RUN apt-get install --fix-missing -y git wget unzip
WORKDIR /opt
RUN wget http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.3.zip -P /opt
RUN unzip fastqc_v0.11.3.zip
RUN chmod 755 FastQC/fastqc
RUN ln -s $(pwd)/FastQC/fastqc /usr/bin/fastqc
RUN apt-get install -y bowtie2 samtools default-jre build-essential python3.6 zlib1g-dev python3-pip
## installing latest version of SRA toolkit
RUN wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/2.8.1-3/sratoolkit.2.8.1-3-ubuntu64.tar.gz
RUN gunzip sratoolkit.2.8.1-3-ubuntu64.tar.gz
RUN tar xvf sratoolkit.2.8.1-3-ubuntu64.tar
RUN ln -s /opt/sratoolkit.2.8.1-3-ubuntu64/bin/* /usr/bin/


RUN pip3 install multiqc
RUN pip3 install cython
RUN pip3 install --user --upgrade cutadapt
RUN pip3 install numpy
RUN pip3 install MACS2

RUN chmod +x ~/.local/bin/cutadapt
RUN ln -s ~/.local/bin/cutadapt /usr/bin/cutadapt

WORKDIR /opt
RUN wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.36.zip
RUN unzip Trimmomatic-0.36.zip
ENV TRIMMOMATIC /opt/Trimmomatic-0.36/trimmomatic-0.36.jar

## meme-chip

WORKDIR /opt
RUN wget http://meme-suite.org/meme-software/4.12.0/meme_4.12.0.tar.gz
RUN tar zxf meme_4.12.0.tar.gz
WORKDIR meme_4.12.0
RUN ./configure  --prefix=/usr/ --with-url=http://meme-suite.org --enable-build-libxml2 --enable-build-libxslt
RUN make
#RUN make test
RUN make install

## Tidy up to remove temporary files etc

WORKDIR /opt
RUN wget https://github.com/broadinstitute/picard/releases/download/2.22.6/picard.jar
ENV PICARD /opt/picard.jar

RUN rm /opt/*.zip
RUN rm /opt/*.tar
RUN rm /opt/*.tar.gz



WORKDIR /


