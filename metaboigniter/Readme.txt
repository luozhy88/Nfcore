


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
方法3：
pip install --index-url https://pypi.tuna.tsinghua.edu.cn/simple python==3.8.15
pip install ms2query==1.2.4  --index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip install rdkit==2023.03.3  --index-url https://pypi.tuna.tsinghua.edu.cn/simple
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

近日,来自荷兰 Wageningen University & Research的Niek F. de Jonge的研究团队在nature communications上发表了一篇名为“MS2Query: reliable and scalable MS2 mass spectra-based analogue search"的文章。这篇文章的主要内容是介绍了一种新的代谢组学分析工具MS2Query,它可以通过质谱峰图的相似性搜索来寻找代谢物结构的类似物。文章指出,传统的代谢组学分析方法通常需要对大量样本进行分析,并且需要使用复杂的数据处理和统计方法来鉴定代谢物。而MS2Query则可以通过快速、准确地搜索质谱峰图相似性来简化这个过程。该研究使用了四个不同的数据集(来自内部标准数据库和在线数据库LIPID MAPS48、 HMDB49和GNPS20)进行验证,证明了该工具能够可靠地预测出35%的光谱类似物,并且平均Tanimoto分数为0.63 (化学相似性) 。因此,作者认为MS2Query是一种可靠且可扩展的质谱数据搜索工具,可以帮助研究人员更好地理解代谢组学数据并鉴定未知代谢产物。



为了成功进行模拟搜索，即使两个分子不相同，也必须有一个光谱相似性分数，该分数可以很好地代表化学相似性。
无监督的 Spec2Vec 和有监督的 MS2Deepscore

首先使用matchms 33 清理数据集。清理元数据以获得统一的格式，并删除或更正错位的元数据。将数据集分为正模式光谱和负模式光谱。对质量裂解峰的强度进行归一化。除去高于1000 Da的峰，并除去强度小于最高峰的0.1%的峰。对于具有超过500个峰的光谱，去除具有最低强度的峰。从库中完全去除具有少于3个峰的光谱。GNPS库中的某些光谱没有存储InChIKey。使用来自matchms extras的方法通过在PubChem上搜索化合物名称和分子式来添加缺失的InChIKeys。将库光谱分为注释和未注释的光谱。如果光谱具有有效的SMILES、InChiKey和Inchi，则认为光谱已完全注释。 未注释的光谱用作Spec2Vec的额外训练光谱，因为Spec2Vec是无监督的。未注释的光谱不用于训练MS2Deepscore、MS2Query或用于测试光谱。

输入行的含义

    行的数量：行的数量取决于查询光谱和库光谱的组合。在训练过程中，MS2Query会从库中选择多个光谱与查询光谱进行配对。每个配对都会生成一行输入数据。
    行代表的内容：每一行代表一个查询光谱与一个库光谱之间的特征组合。这些特征包括：
        Spec2Vec相似度分数
        查询前体m/z
        前体m/z差异
        10个化学相似的库分子的加权平均MS2Deepscore
        这10个化学相似的库分子的平均Tanimoto分数

训练过程中的行生成
在训练过程中，MS2Query会从库中选择多个光谱与查询光谱进行配对。具体步骤如下：

    选择光谱对：从库中选择多个光谱与查询光谱进行配对。通常会选择前2000个相似度最高的库光谱。
    计算特征：对于每个查询光谱与库光谱的配对，计算上述五个特征。
    生成输入行：每个查询光谱与库光谱的配对生成一行输入数据，这些行数据用于训练随机森林模型。

因此，随机森林模型的输入行代表的是查询光谱与库光谱之间的特征组合，每一行包含一个查询光谱与一个库光谱的五个特征

在MS2Query模型的训练过程中，选择了大约1/40的独特InChIKeys和1/40的剩余光谱。具体来说，训练光谱对的生成步骤如下：

    选择光谱对：从库中随机选择1/40的独特InChIKeys和1/40的剩余光谱。
    生成光谱对：从选定的光谱中，每个光谱与库中MS2Deepscore得分最高的100个光谱配对，生成光谱对。

因此，训练过程中使用的光谱数量是库中光谱总数的1/40，再加上这些光谱与库中得分最高的100个光谱配对生成的光谱对
