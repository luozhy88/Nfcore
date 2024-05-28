


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


