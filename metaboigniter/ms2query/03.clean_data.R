
rm(list=ls())
library(readr)
library(dplyr)
kegg.com=read.csv("../input/CIDindex.txt",sep="\t") 

# 读取文件内容  
clean_input=function(db.filename="POS.msp"){
  # db.filename <- "POS.msp"
  # db.filename <- "NEG.msp"  
  print(db.filename)
  file_content <- readLines(db.filename, encoding = "UTF-8") # 确保编码正确  
  # file_content <- file_content[1:10000]
  # 检查以"Name"开头的行数  
  name_lines <- grepl("^Name", file_content)  
  cat("Number of lines starting with 'Name':", sum(name_lines), "\n")  
  
  # 如果存在以"Name"开头的行，则继续分割数据  
  all.list.re=list()
  if (sum(name_lines) > 0) {  
    split_data <- split(file_content, cumsum(name_lines))  
    split_data <- split_data[-1] # 移除第一个空元素  
    
    # 访问每个模块  
    for (i in 1:length(split_data)) {  
      # cat("Module", i, ":\n")
      # cat(split_data[[i]], sep = "\n")
      # cat("\n")
      # i=5
      sub.content=split_data[[i]]
      Name=grep("^Name: ",sub.content,value=TRUE)
      Name=gsub("^Name: ","",Name) %>% make.names()
      sub.content=gsub("Comment: ","SCANS=",sub.content)
      sub.content=gsub("Charge: ","Charge=",sub.content)
      sub.content=gsub("Num Peaks: ","NumPeaks=",sub.content)
      sub.content=gsub("PrecursorMZ: ","Precursor_MZ=",sub.content) 
      sub.content=gsub("Name: ","NAME=",sub.content) 
      IONMODE=if_else(grepl("POS",db.filename),"IONMODE=Positive","IONMODE=Negative")
      # sub.content=c("BEGIN IONS",sub.content,"END IONS")
      
      sub.content=gsub("PrecursorMZ: ","PRECURSOR_MZ=",sub.content) 
      # sub.content=gsub("PrecursorMZ: ","PRECURSOR_MZ=",sub.content) 
      sub.content=gsub("Ion_mode: P","IONMODE=Positive",sub.content)
      sub.content=gsub("Ion_mode: N","IONMODE=Negative",sub.content)
      sub.content=gsub("Name: ","NAME=",sub.content)
      sub.content=gsub("Synon: ","Synon=",sub.content)
      sub.content=gsub("DB#: ","DB=",sub.content)
      sub.content=gsub("InChIKey: ","InChIKey=",sub.content)
      sub.content=gsub("Spectrum_type: ","Spectrum_type=",sub.content)
      sub.content=gsub("Instrument_type: ","Instrument_type=",sub.content)
      sub.content=gsub("Instrument: ","Instrument=",sub.content)
      sub.content=gsub("Formula: ","Formula=",sub.content)
      sub.content=gsub("MW: ","MW=",sub.content)
      sub.content=gsub("ExactMass: ","parent_mass=",sub.content)
      sub.content=gsub("Comments: ","scans=",sub.content)
      sub.content=gsub("Num Peaks: ","NumPeaks=",sub.content)
      sub.content=gsub("Precursor_type: ","ADDUCT=",sub.content)
      sub.content=gsub("Collision_energy: ","Collision_energy=",sub.content)
      sub.content=gsub("Retention_index: ","Retention_index=",sub.content)
      sub.content=sub.content[sub.content!="" ]
      
      split_content <- strsplit(sub.content, '\" \"')
      split_content <- unlist(split_content)
      # 拆分Comments
      split_content <- gsub('^\"|\"$', '', split_content)
      INCHI=grep("InChI=InChI",split_content,value=TRUE) 
      INCHI=gsub("InChI=InChI=","InChI=",INCHI)
      INCHI=grep("InChI=InChI",split_content,value=TRUE) 
      INCHI=gsub("InChI=InChI=","INCHI=",INCHI)
      SMILES=grep("Comments=\"SMILES=",split_content,value=TRUE) 
      SMILES=gsub("Comments=\"SMILES=","SMILES=",SMILES)
      # grepl("^\\d.*\\s", sub.content)
      sub.content <- gsub("(\\d)\\s(\\d)", "\\1\t\\2", sub.content)
      # writeLines(paste(sub.content,collapse = "\n"), "output/ceshi.mgf" , sep = "\n\n")
      sub.content=c("BEGIN IONS",INCHI,SMILES,IONMODE,sub.content,"END IONS")
      sub.content=sub.content[!grepl("Comments",sub.content) ]
      
      all.list.re[[Name]]=sub.content
      
    }  
  } else {  
    cat("No lines starting with 'Name' found in the file.\n")  
  }
  
  # 假设 all.list.re 是您要写入文件的列表  
  dir.create("output", showWarnings = FALSE)
  # 将列表扁平化为一个字符向量  
  flat_list <- unlist(lapply(all.list.re, function(x) paste(x, collapse = "\n")))  
  # 将扁平化的字符向量写入文件，每个元素之间用换行符分隔  
  out.name=basename(db.filename)
  writeLines(flat_list, gsub("msp","mgf",glue::glue("output/tidy.{out.name}") ) , sep = "\n\n")
}

clean_input(db.filename="data/POS.msp")
clean_input(db.filename="data/NEG.msp")

################################################## run annoation ################################################## 
system("/home/zhiyu/miniconda3/envs/ms2query1.2.4/bin/ms2query --spectra /home/zhiyu/data/software/ms2query.by_keggname/test3/output/tidy.POS.mgf  --library /data/software/nfcore/ms2query6_kegg/positive_mode/exact_matches_test_sets_splits/test_split_1/models  --ionmode positive --additional_metadata scans")
system("/home/zhiyu/miniconda3/envs/ms2query1.2.4/bin/ms2query --spectra /home/zhiyu/data/software/ms2query.by_keggname/test3/output/tidy.NEG.mgf  --library ~/data/software/nfcore/ms2query6_kegg/negative_mode/exact_matches_test_sets_splits/test_split_1/models  --ionmode negative --additional_metadata scans")
################################################## add kegg compound name ################################################## 
re_df_filename="output/results/tidy.POS.csv"
re_df=read.csv(re_df_filename)  
re_df_kegg_pos=merge(re_df,kegg.com,by.x="analog_compound_name",by.y="meta",all.x=TRUE)
# 计算空值占得比例
sum(!is.na(re_df_kegg_pos$CID))/nrow(re_df_kegg_pos)
write.csv(re_df_kegg_pos,gsub("csv","kegg.csv",re_df_filename ),row.names = FALSE)


re_df_filename="output/results/tidy.NEG.csv"
re_df=read.csv(re_df_filename)  
re_df_kegg_neg=merge(re_df,kegg.com,by.x="analog_compound_name",by.y="meta",all.x=TRUE)
# 计算空值占得比例
sum(!is.na(re_df_kegg_neg$CID))/nrow(re_df_kegg_neg)
write.csv(re_df_kegg_neg,gsub("csv","kegg.csv",re_df_filename ),row.names = FALSE)

ALL_re_df=rbind(re_df_kegg_pos,re_df_kegg_neg)
write.csv(ALL_re_df,gsub("csv","kegg.csv","output/results/tidy.POS.NEG.csv" ),row.names = FALSE)
################################################## add kegg compound name ################################################## 
##################################################     对比之前的结果     ################################################## 

library(readxl)
all_measurement <- read_csv("~/data/software/ms2query.by_keggname/test/Metabolite_data.csv")

df_pre_re=merge(all_measurement,ALL_re_df,by.x="ID",by.y="scans",all.x=TRUE)
df_pre_re$re=c(df_pre_re$KEGG==df_pre_re$CID)
print("比对数量：")
sum(  !is.na(df_pre_re$CID ) )/nrow(df_pre_re)

print("pre and now:")
summary(df_pre_re$re)
# 计算re列中TRUE的比例
label_counts <- table(df_pre_re$re)
label_percentages <- prop.table(label_counts) * 100
print(label_percentages)

# 之前计算结果匹配的比例

print("pre 方法匹配的数目为:")
sum(!is.na(  df_pre_re$KEGG  ) )/nrow(df_pre_re) *100



write.csv(df_pre_re,gsub("csv","kegg.csv","output/results/tidy.POS.NEG_with_pre_re.csv" ),row.names = FALSE)



