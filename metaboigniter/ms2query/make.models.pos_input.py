
import os
from ms2query.benchmarking.k_fold_cross_validation import split_and_store_annotated_unannotated, split_k_fold_cross_validation_analogue_test_set, split_k_fold_cross_validation_exact_match_test_set
from ms2query.utils import load_matchms_spectrum_objects_from_file, select_files_in_directory

#spectrum_file_name = "ALL_GNPS_NO_PROPOGATED.mgf"
# spectrum_file_name = "/home/zhiyu/data/software/nfcore/ms2query4/GNPS-LIBRARY.mgf"
# spectrum_file_name = "/home/zhiyu/data/software/nfcore/ms2query4/ALL_GNPS_NO_PROPOGATED0.mgf"
# spectrum_file_name = "/home/zhiyu/data/software/ms2query.by_keggname/input/output/MassBank_name.in.kegg.mgf"
# spectrum_file_name = "/home/zhiyu/data/software/nfcore/ms2query6_kegg/MassBank_GNPS_test.mgf"
spectrum_file_name = "/home/zhiyu/data/software/ms2query.by_keggname/input/output/Merge_db_name.in.kegg.mgf"

positive_output_folder=os.path.join(os.getcwd(),"positive_mode_data_split")

os.makedirs(positive_output_folder, exist_ok=True)


split_and_store_annotated_unannotated(spectrum_file_name, ion_mode="positive", output_folder=positive_output_folder)



positive_annotated_spectra = load_matchms_spectrum_objects_from_file("positive_mode_data_split/annotated_training_spectra.pickle")







# Run for positive mode spectra
os.makedirs("positive_mode/analogue_test_sets_splits/", exist_ok=True)
os.makedirs("positive_mode/exact_matches_test_sets_splits/", exist_ok=True)
split_k_fold_cross_validation_analogue_test_set(positive_annotated_spectra, 20, output_folder = "./positive_mode/analogue_test_sets_splits/")
split_k_fold_cross_validation_exact_match_test_set(positive_annotated_spectra, 20, output_folder = "./positive_mode/exact_matches_test_sets_splits/")

# Run for negative mode spectra
# os.makedirs("negative_mode/analogue_test_sets_splits/", exist_ok=True)
# os.makedirs("negative_mode/exact_matches_test_sets_splits/", exist_ok=True)
# split_k_fold_cross_validation_analogue_test_set(negative_annotated_spectra, 20, output_folder = "negative_mode/analogue_test_sets_splits/")
# split_k_fold_cross_validation_exact_match_test_set(negative_annotated_spectra, 20, output_folder = "negative_mode/exact_matches_test_sets_splits/")

# The 20 different datasplits will be stored in the specified folders
os.system("cp -rf positive_mode_data_split/* positive_mode/exact_matches_test_sets_splits/")
# os.system("cp -rf negative_mode_data_split/* negative_mode/exact_matches_test_sets_splits/")


from ms2query.benchmarking.k_fold_cross_validation import train_models_and_test_result_from_k_fold_folder
k_fold_split_number = 1 # Vary this number between 0 and 19
train_models_and_test_result_from_k_fold_folder("positive_mode/exact_matches_test_sets_splits/",k_fold_split_number,exact_matches=True) # Change for analogue test set, this will change the precursor m/z prefiltering to match exact matches or analogue search for the reference benchmarking methods. 



# ~/miniconda3/envs/ms2query1.2.4/bin/python

#ms2query --spectra sanshu.dummy_spectra_pos.mgf  --library positive_mode/exact_matches_test_sets_splits/test_split_1/models  --ionmode positive --additional_metadata scans
#/home/zhiyu/miniconda3/envs/ms2query1.2.4/bin/ms2query --spectra sanshu.dummy_spectra_pos.mgf  --library positive_mode/exact_matches_test_sets_splits/test_split_1/models  --ionmode positive --additional_metadata scans

/home/zhiyu/miniconda3/envs/ms2query1.2.4/bin/ms2query --spectra /home/zhiyu/data/software/ms2query.by_keggname/test3/data/output/tidy.POS.mgf  --library positive_mode/exact_matches_test_sets_splits/test_split_1/models  --ionmode positive --additional_metadata scans



