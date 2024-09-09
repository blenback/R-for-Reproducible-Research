library(dockerfiler)

# Create a dockerfile template
RiceFarm_dock <- Dockerfile$new()

# Add maintainer
RiceFarm_dock$MAINTAINER("Your_name", "Your_email")

# Add R base image
# RiceFarm_dock$FROM("rocker/r-base")

# Create directory in the image for adding the files
RiceFarm_dock$RUN("mkdir /home")

# Copy the data directory
RiceFarm_dock$COPY("/Data", "/home")

# Copy the scripts directory
RiceFarm_dock$COPY("/Scripts", "/home")

# Copy the master script
RiceFarm_dock$COPY("/RiceFarm_master.R", "/home")

# Add R packages
RiceFarm_dock$RUN(r(install.packages("ggplot2")))
RiceFarm_dock$RUN(r(install.packages("stringr")))

# Add the command to run the master script
RiceFarm_dock$CMD("Rscript /home/RiceFarm_master.R ")

# save the Dockerfile
RiceFarm_dock$write()


# run in the terminal with the '-v' flag to extract the results from the container
docker run -v ~/mydocker/results:/home/results  analysis 