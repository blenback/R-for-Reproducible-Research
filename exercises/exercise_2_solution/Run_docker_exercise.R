# Load dockerfiler package
library(dockerfiler)

# Get your R version to select a base image
R.Version()$version.string

# Create a dockerfile template object
# and specify your version of R in the base image name
# my version is 4.3.1 hence the base image is rocker/r-ver:4.3.1
RiceFarm_dock <- Dockerfile$new(FROM = "rocker/r-ver:4.3.1")

# Add maintainer information
RiceFarm_dock$MAINTAINER("Your_name", "Your_email")

# By default images contain a home directory and we will move the files we need there

# Copy the data directory
RiceFarm_dock$COPY("/Data", "/home/Data")

# Copy the scripts directory
RiceFarm_dock$COPY("/Scripts", "/home/Scripts")

# Copy the master script
RiceFarm_dock$COPY("/RiceFarm_master.R", "/home")

# For our project we need "ggplot2" and "stringr" packages
# We could try to find a base image on Rocker that has these installed
# But because we are not using lots of packages lets just install them in the container
RiceFarm_dock$RUN(r(install.packages("ggplot2")))
RiceFarm_dock$RUN(r(install.packages("stringr")))

# Add the command to run the master script
RiceFarm_dock$CMD("Rscript /home/RiceFarm_master.R ")

# save the Dockerfile
RiceFarm_dock$write()

# Create dir to receive results from container
dir.create("/output")

# Now in the terminal build the Docker image
# docker build --build-arg WHEN=2019-01-06 -t analysis .



# run in the terminal with the '-v' flag to extract the results from the container
# docker run -v ~/output:/home/Outputs/Visualisations  analysis 

# copy the results to the output directory
# cp -r /home/Outputs/Visualisations ~/output
