
# sudo yum install java-17-openjdk-devel
# sudo update-alternatives --config java
export NXF_SINGULARITY_CACHEDIR="/home/zhiyu/data/singularity" #定义SINGU
#./nextflow run ~/data/software/nfcore/metaboigniter/metaboigniterv2.0.1  -profile singularity,test_full --outdir test3  --bind   -resume
#./nextflow run ~/data/software/nfcore/metaboigniter/metaboigniterv2.0.1  -profile docker,test_full --outdir test5  -resume --docker_runOptions '--network=host'


#./nextflow run ~/data/software/nfcore/metaboigniter/metaboigniterv2.0.1  -profile docker,test_full --outdir test7  -resume  -with-docker "docker --network host"


#--adducts_pos --adducts_neg --model_folder  /home/zhiyu/data/software/nfcore/metaboigniter/downloads
#./nextflow run ~/data/software/nfcore/metaboigniter/metaboigniterv2.0.1  -profile docker,test_full   --outdir test18/ceshi  --sirius_sirius_candidates 1 -resume --input ~/data/software/nfcore/metaboigniter/samplesheet.csv  
#./nextflow run ~/data/software/nfcore/metaboigniter/metaboigniterV2.0.1  -profile docker,test_full   --polarity negative --outdir test18/ceshi.neg  --sirius_sirius_candidates 1 -resume --input ~/data/software/nfcore/metaboigniter/samplesheet.csv
# ./nextflow run /data/data1/zhiyu/data/software/nfcore/metaboigniter/metaboigniter/metaboigniterV2.0.1  -profile docker,test_full   --polarity negative --outdir test18/ceshi.neg  --sirius_sirius_candidates 1 -resume --input /data/data1/zhiyu/data/software/nfcore/metaboigniter/metaboigniter/samplesheet.csv

./nextflow run /data/data1/zhiyu/data/software/nfcore/metaboigniter/metaboigniter/metaboigniterV2.0.1  -profile docker,test_full   --polarity negative --outdir metab.test/NEGce  --sirius_sirius_candidates 1 -resume --input /data/data1/zhiyu/data/software/nfcore/metaboigniter/metaboigniter/20240423-SNRB042623120601-WYJ-Nontarget-P.neg2.csv


#./nextflow run ~/data/software/nfcore/metaboigniter/metaboigniterv2.0.1  -profile docker,test_full  --polarity positive --outdir metab.test/POS  --sirius_sirius_candidates 1 -resume --input ~/data/software/nfcore/metaboigniter/20240423-SNRB042623120601-WYJ-Nontarget-P.pos2.csv
#./nextflow run ~/data/software/nfcore/metaboigniter/metaboigniterv2.0.1  -profile docker,test_full   --polarity negative --outdir metab.test/NEG  --sirius_sirius_candidates 1 -resume --input ~/data/software/nfcore/metaboigniter/20240423-SNRB042623120601-WYJ-Nontarget-P.neg2.csv
