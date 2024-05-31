


分子离子的质荷比就是化合物的分子量。
“质谱”是质量谱，大部分实验不能仅仅使用质谱，而是气相色谱-质谱联用(以下简称GC-MS)。简单说，复杂混合物通过气相色谱后被分离成相对简单的组分，每个组分分别被离子化带上电荷，由于质量不同而在质谱检测器上呈现出不同的质量/电荷比。由于离子化的过程中一些的化学键可能发生断裂，因此不同的化学结构往往呈现出不同的质谱图，通过比对，可以对物质进行定性检测。
PrecursorMZ（前体m/z）指的是前体离子的质荷比（mass-to-charge ratio, m/z）。前体离子是指在质谱仪中被选择进行进一步碎裂的离子。

https://www.shiyanjia.com/knowledge/articleinfo-1496.html
https://systemsomicslab.github.io/compms/msdial/main.html#MSP
https://hmdb.ca/downloads
https://github.com/ZhuMSLab/MetDNA/tree/master
https://sciex.com/content/dam/SCIEX/pdf/brochures/identification-of-compounds-by-accurate-mass-spectrometry.pdf
https://www.omicsolution.com/index.php/News/detail/id/158.html
https://stack.xieguigang.me/2022/look-inside-metadna-annotation-algorithm/
https://www.cnblogs.com/miyuanbiotech/p/12732609.html




docker run -v /data/data1/zhiyu/data/software/nfcore/metaboigniter/ms2query:/home/test quay.io/biocontainers/ms2query:1.2.3--pyhdfd78af_0 ms2query --spectra /home/test/dummy_spectra.mgf  --library /home/test/Download/neg/downloads --ionmode positive


docker run -v /data/data1/zhiyu/data/software/nfcore/metaboigniter/ms2query:/home/test quay.io/biocontainers/ms2query:1.2.3--pyhdfd78af_0 ms2query --spectra /home/test/dummy_spectra.mgf  --library /home/test/Download/pos --ionmode positive


https://github.com/LiChenPU/NetID  #https://www.nature.com/articles/s41592-021-01303-3
https://jaspershen.github.io/metID
https://www.bioconductor.org/packages/release/bioc/html/MetaboAnnotation.html
Ms2query #https://github.com/iomega/ms2query/tree/0c9ce6757880436b4833abdc7325ce478669e578 https://www.nature.com/articles/s41467-023-37446-4

# Database
https://github.com/MassBank/MassBank-data/tree/main
https://chemdata.nist.gov/dokuwiki/doku.php?id=peptidew:lib:human20140529
https://hmdb.ca/downloads

# ms2query1.2.4
conda activate ms2query1.2.4
mamba  install python=3.8.15
conda install -y  bioconda::ms2deepscore=0.4
mamba  install -y --channel bioconda --channel conda-forge spec2vec=0.8.0
mamba install  -y h5py=3.9.0  pyarrow=12.0.1 skl2onnx=1.15.0 onnxruntime=1.15.1 pytest=7.4.0  zip 
mamba install -y pandas=1.5.3  matplotlib=3.7.2  #自动安装numpy=1.24.4 pandas=2.0.3  
mamba install -y scikit-learn=1.3.0

pip install ms2query==1.2.4  --index-url https://pypi.tuna.tsinghua.edu.cn/simple
################################################################
wget -c https://pypi.tuna.tsinghua.edu.cn/packages/f4/e6/307c4f83b54e15d4a3531b263fb48dd69cb886deb5801ca0152680493b0e/tensorflow-2.8.4-cp38-cp38-manylinux2010_x86_64.whl#sha256=b43137a87b59d83abaf6e2e8dcdad0e2640c728c24d995565042316ccbf56440
pip install ./tensorflow-2.8.4-cp38-cp38-manylinux2010_x86_64.whl #本地安装

pip install --index-url https://pypi.tuna.tsinghua.edu.cn/simple libclang-18.1.1-py2.py3-none-manylinux2010_x86_64.whl
pip install --index-url https://pypi.tuna.tsinghua.edu.cn/simple libclang #指定镜像源安装包


mamba install -c  bioconda tensorflow-base=2.8.1=cpu_py38hc7a75a0_0



#代谢通路相关数据库
BiocManager::install("ReactomePA")
BiocManager::install("reactome.db")
https://mona.fiehnlab.ucdavis.edu/downloads
devtools::install_github("ncats/RaMP-DB")
sudo yum install mariadb-connector-c-devel | mariadb-devel | mysql-devel
BiocManager::install("BiocFileCache")


# 创建安装路径(如果不存在)
dir.create("/data/data1/zhiyu/R/4x/library", recursive = TRUE)
install.packages("/data/data1/zhiyu/R/4x/reactome.db_1.88.0.tar.gz",   repos = NULL,    lib = "/data/data1/zhiyu/R/4x/library")
.libPaths(c("/data/data1/zhiyu/R/4x/library", .libPaths()))
https://rampdb.nih.gov/analytes-from-pathways
library(RaMP)
rampDB <- RaMP()


# metid

remotes::install_gitlab("tidymass/metid")
remotes::install_gitlab("tidymass/massdatabase", dependencies = TRUE)
remotes::install_gitlab("jaspershen/massdataset")
install.packages("BiocManager")
BiocManager::install("MSnbase")
BiocManager::install("ComplexHeatmap")
BiocManager::install("mzR", suppressUpdates = TRUE)
BiocManager::install("Rdisop")
remotes::install_gitlab("jaspershen/masstools")
BiocManager::install("SummarizedExperiment")


?annotate_metabolites_mass_dataset 


# 总结好的鉴定库
https://mona.fiehnlab.ucdavis.edu/downloads
