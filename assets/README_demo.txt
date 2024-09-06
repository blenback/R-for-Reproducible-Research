This ICoLCM_readme.txt file was generated on 2022-07-28 by Benjamin Black

GENERAL INFORMATION

1. Title of Dataset: Research data: Improving calibration of land use change models through validation of transition potential predictions.    

2. Author Information
	A. Principal Investigator Contact Information
		Name: Benjamin Black
		Institution:  Institute for Spatial and Landscape Development, Swiss Federal Institute of Technology (ETH) 
		Address:  HIL H 52.1, Stefano-Franscini-Platz 5 CH-8093 Zürich, Switzerland
		Email: bblack@ethz.ch

	B. Associate author
		Name: Antoine Adde
		Institution: Ecospat - Spatial Ecology Group, Department of Ecology & Evolution, University of Lausanne
		Address: Biophore, Lausanne, 1015 Switzerland
		Email: antoine.adde@unil.ch

	C. Associate author
		Name: Philipp Brun
		Institution: Swiss Federal Institute for Forest, Snow and Landscape Research
		Address: Zürcherstrasse 111, CH-8903 Birmensdorf
		Email: philipp.brun@wsl.ch

3. Date of data collection: 2021-05-01 > 2022-01-15 

4. Geographic location of data: Switzerland 


SHARING/ACCESS INFORMATION

1. Licenses/restrictions placed on the data: Creative Commons Attribution 4.0 International

2. Links to publications that cite or use the data: Black, Benjamin, Maarten J. van Strien, Antoine Adde, and Adrienne Grêt-Regamey.
 “Re-Considering the Status Quo: Improving Calibration of Land Use Change Models through Validation of Transition Potential Predictions.”
 Environmental Modelling & Software 159 (January 1, 2023): 105574. https://doi.org/10.1016/j.envsoft.2022.105574.
 

3. Was data derived from another source? Yes, see sections 2.1.1 and 2.2.2 for citations of data sources in publication 

4. Recommended citation for this dataset: Black, B., Adde, A., Brun, P. Research data: 
Improving calibration of land use change models through validation of transition potential predictions.
doi: 10.5281/zenodo.6912914. 

DESCRIPTION/REPRODUCIBILITY: 
- This folder contains processed data and scripts which can be used to reproduce the results of the publication (Black et al. above). 
- The workflow is presented as a self-contained R project,which makes all file paths relative to the root directory, 
the first file the user should open is the RPROJ file: ICoLCM.RPROJ
- The workflow uses the 'renv' package to include the correct versions of all required packages. The ICoLCM_master.R script contains 
the line renv::restore() which is necessary to install the required packages from the project library.If you are unfamiliar with 
renv workflows please consult the available vignettes: https://rstudio.github.io/renv/articles/renv.html. 
- Users should utilise the master script (ICoLCM_master.R) to source the other scripts in the order that they are presented within this script.
Some lines in the master script, sourcing certain scripts are commented out because these represent processes of data preparation that it is
unnecessary to perform because the processed data has already been provided. In this way the research workflow can be recreated without the need
to include large amounts of raw data. All scripts and function contain adequate commentary to guide the user through the processes.
- Results produced when replicating the research will not exactly match those presented in the publication due to random sampling being used to
produce test/training sets for modelling replicates however the general trends should still be expected to be the same.  

FILE OVERVIEW

Below is a list of relevant folders, sub-folders and files contained in the main ICoLCM folder, main sub-folders have not been listed as they
simply container empty placeholder.txt files but are necessary for results to be saved into. 

Folder and file List:
--ICoLCM
    ¦
    ¦--.Rproj.user : Hidden folder for Rproj files (Do not delete)
    ¦
    ¦--Data                                                  
    ¦   ¦--Bioreg_CH: : Spatial data files for the Swiss Bioregions used to seperate LULC transition datasets                                                                                                
    ¦   ¦   ¦--Bioreg_shape.cpg                           
    ¦   ¦   ¦--Bioreg_shape.dbf               
    ¦   ¦   ¦--Bioreg_shape.prj                     
    ¦   ¦   ¦--Bioreg_shape.shp                              
    ¦   ¦   °--Bioreg_shape.shx
    ¦   ¦                          
    ¦   ¦--Covariates                                        
    ¦   ¦   ¦--Neighbourhood                                 
    ¦   ¦   ¦   ¦--Neighbourhood_details_for_dynamic_updating: : Placeholder folder for storing details 
    ¦	¦   ¦	¦	of neighbourhood layers retained in feature selection
    ¦   ¦   ¦   ¦                         
    ¦   ¦   ¦   ¦--Neighbourhood_layers: : Placeholder folder where spatial data of neighbourhood layers is saved                      
    ¦   ¦   ¦   ¦                          
    ¦   ¦   ¦   °--Neighbourhood_matrices                    
    ¦   ¦   ¦       °--ALL_matrices.rds: RDS. object containing Random Pythagorian matrices used to produce neighbourhood covariate layers
    ¦   ¦   ¦                
    ¦   ¦   ¦     
    ¦   ¦   °--Calibration_covariate_data_1985_1997.csv
    ¦   ¦   °--Calibration_covariate_data_1997_2009.csv
    ¦   ¦   °--Calibration_covariate_data_2009_2018.csv : Tables containing details of all covariates,
    ¦	¦      used directly by scripts for dataset preparation and feature selection CAUTION in EDITING
    ¦   ¦        
    ¦   ¦--LULC                                              
    ¦   ¦   ¦--Aggregated_LULC: Placeholder folder where rasters of aggregated LULC data are stored                               
    ¦   ¦   ¦                              
    ¦   ¦   ¦--NOAS04_LULC                                   
    ¦   ¦   ¦   ¦--rasterized: Placeholder folder for rasterized LULC data under original categories                                
    ¦   ¦   ¦   ¦                         
    ¦   ¦   ¦   °--raw                                       
    ¦   ¦   ¦       °--AREA_NOAS04_72_LATEST.csv: File containing raw LULC data for multiple time periods (Swiss Areal Statistiks)             
    ¦   ¦   °--Transition_matrices                           
    ¦   ¦                                  
    ¦   ¦--tools                                             
    ¦   ¦   ¦--model_specs.csv: Table controlling specifciations of models to be produced, existing values will replicate results of publication
    ¦   ¦   ¦                    Alternative time periods can be specifcied
    ¦   ¦   °--param-grid.csv: Table controlling the Random Forests hyperparameter settings rows specify the number trees to be modelled
    ¦   ¦                        
    ¦   ¦--Transition_datasets                               
    ¦   ¦   ¦--Full_data: Placeholder folder for complete LULC+covariate datasets                                     
    ¦   ¦   ¦                             
    ¦   ¦   ¦--Post_covariate_filtering: Placeholder folder for transition datasets post-feature selection                      
    ¦   ¦   ¦                             
    ¦   ¦   ¦--Pre_covariate_filtering
    ¦   ¦   ¦   °--Period_2009_2018_trans_datasets_regionalized.rds: File containing regionalized transition datasets DO NOT REMOVE                      
    ¦   ¦   ¦                              
    ¦   ¦   °--Regional_data: Placeholder for regionalized LULC+cov datasets
    ¦   ¦                                                         
    ¦   ¦                                    
    ¦   °--Ref_grid.tif -Spatial grid files specificying extent, resolution and CRS for all spatial data 
    ¦
    ¦
    ¦--renv: Directory containing all files necessary for constructing the R environment to run the workflow, users should not edit files manually.
    ¦
    ¦                                  
    ¦--Results                                               
    ¦   ¦--Figures: Placeholder folders to store visualisations produced by analysis                                           
    ¦   ¦   ¦--Covariate_selection                           
    ¦   ¦   ¦                              
    ¦   ¦   ¦--Downsampling                                  
    ¦   ¦   ¦                              
    ¦   ¦   ¦--Model_evaluation                              
    ¦   ¦   ¦   ¦--Boyce_ROC_curves                          
    ¦   ¦   ¦   ¦                          
    ¦   ¦   ¦   ¦--Model_generalizability                    
    ¦   ¦   ¦   ¦                          
    ¦   ¦   ¦   ¦--Model_parsimony                           
    ¦   ¦   ¦   ¦                          
    ¦   ¦   ¦   ¦--RF_GLM_plots                              
    ¦   ¦   ¦   ¦                          
    ¦   ¦   ¦   ¦--RF_num_trees_plots                        
    ¦   ¦   ¦   ¦                         
    ¦   ¦   ¦   °--RF_plots                                  
    ¦   ¦   ¦                              
    ¦   ¦   °--publication_specific                          
    ¦   ¦                                  
    ¦   ¦--Fitted_models: Placeholder folder to store fitted statistical model objects from analysis                                     
    ¦   ¦                                  
    ¦   ¦--Model_comparison: Placeholder folder to store results of comparison between model specifications                                
    ¦   ¦                                  
    ¦   ¦--Model_evaluation: Placeholder folder to store model evaluation tables from analysis                                  
    ¦   ¦                                 
    ¦   °--Model_tuning: Placeholder folder to store results of model tuning excercies                                       
    ¦       ¦--Covariate_selection                           
    ¦       ¦   ¦--Cov_selection_summaries                   
    ¦       ¦   ¦                          
    ¦       ¦   ¦--Covariate_collinearity_filtering          
    ¦       ¦   ¦                          
    ¦       ¦   °--GRRF_embedded_selection                   
    ¦       ¦                              
    ¦       ¦--Down_sampling                                 
    ¦       ¦                              
    ¦       °--RF_hyper_param_comparison                     
    ¦
    ¦--Scripts                                               
    ¦   ¦--Data_preparation                                  
    ¦   ¦   ¦--LULC_prep.R: preparation of LULC data, aggregation and calculation of transition matrices                                    
    ¦   ¦   ¦--Neighbourhood_prep.R: Preparation of neighbourhood covariate layers                           
    ¦   ¦   ¦--Region_prep.R: Preparation of Swiss Bioregions spatial data (does not need to be run)                                 
    ¦   ¦   ¦--SA_var_prep.R: Preparation of suitability and accessibility covariate data (does not need to be run)                                  
    ¦   ¦   °--Transition_dataset_prep.R: Preparation of LULC transition datasets
    ¦   ¦              
    ¦   ¦--Functions: All functions contain roxygen documentation describing their purpose, parameters and authorship                                         
    ¦   ¦   ¦--lulcc.analysecovselection.R                   
    ¦   ¦   ¦--lulcc.analysedownsampling.R                   
    ¦   ¦   ¦--lulcc.binarizetransitiondatasets.R            
    ¦   ¦   ¦--lulcc.BoyceROCcurves.R                        
    ¦   ¦   ¦--lulcc.covfilter.R                             
    ¦   ¦   ¦--lulcc.evalcurves.R                            
    ¦   ¦   ¦--lulcc.evalfeatureselection.R                  
    ¦   ¦   ¦--lulcc.evaluate.R                              
    ¦   ¦   ¦--lulcc.extractsplitrasterstack.R               
    ¦   ¦   ¦--lulcc.filtersel.R                             
    ¦   ¦   ¦--lulcc.fitevalsave.R                           
    ¦   ¦   ¦--lulcc.fitmodel.R                              
    ¦   ¦   ¦--lulcc.grrffeatselect.R                        
    ¦   ¦   ¦--lulcc.identifyfocalsforupdating.R             
    ¦   ¦   ¦--lulcc.modelstatscomparison.R                  
    ¦   ¦   ¦--lulcc.neighbourhoodlayercreation.R            
    ¦   ¦   ¦--lulcc.plotBoyceandROCcurves.R                 
    ¦   ¦   ¦--lulcc.preps.R                                 
    ¦   ¦   ¦--lulcc.savethis.R                              
    ¦   ¦   ¦--lulcc.setparams.R                             
    ¦   ¦   ¦--lulcc.splitforcovselection.R                  
    ¦   ¦   ¦--lulcc.summarisecovselection.R                 
    ¦   ¦   ¦--lulcc.summarisemodelevaluation.R              
    ¦   ¦   ¦--lulcc.testrastercompatibility.R               
    ¦   ¦   ¦--lulcc.viabletranslist.R                       
    ¦   ¦   ¦--pipe.all_metrics_function.R                   
    ¦   ¦   ¦--pipe.ceval.R                                  
    ¦   ¦   ¦--pipe.df_or_rast.R                             
    ¦   ¦   ¦--pipe.multi.R                                  
    ¦   ¦   ¦--pipe.multi_input_class.R                      
    ¦   ¦   ¦--pipe.prd.R                                    
    ¦   ¦   ¦--pipe.summary_wsl_evaluation.R                 
    ¦   ¦   ¦--preva_meta.R                                  
    ¦   ¦   ¦--wsl_evaluation_class.R                        
    ¦   ¦   °--wsl_fit_class.R
    ¦   ¦                        
    ¦   ¦--Transition_modelling                              
    ¦   ¦   ¦--Export_publication_plots.R: Produce final plots as used in publication                    
    ¦   ¦   ¦--Feature_selection.R: Perform 2 step feature selection process on transition datasets                           
    ¦   ¦   ¦--Model_comparison.R: Perform comparisons between transition model specifcations                            
    ¦   ¦   ¦--Model_evaluation.R: Summarize performance of models and parameter tuning                            
    ¦   ¦   °--Trans_modelling.R: Perform statistical modelling of transition datasets
    ¦   ¦                      
    ¦   °--ICoLCM_master.R: Master script used to source(run) all necessary scripts to repeat analysis
    ¦
    ¦--ICoLCM.RPROJ : R-project file for workflow
    ¦
    °--renv.lock : renv lock file documenting package requirements (do not edit manually)                              

METHODOLOGICAL INFORMATION

1. Description of methods used for collection/generation of data: Raw data was gathered from open access sources (See section 2.1.1 and Table 2 of publication). 
Preparation of spatial data was performed in R 4.0.5 projected using the Swiss CH1903+ / LV95 coordinate reference system.
 
2. Instrument- or software-specific information needed to interpret the data: RStudio >= version 4.0.5.