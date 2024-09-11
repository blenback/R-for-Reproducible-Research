library(dockerfiler)

# Create a dockerfile template
RiceFarm_dock <- Dockerfile$new()

# Add maintainer
RiceFarm_dock$MAINTAINER("Your_name", "Your_email")

# Add R and RStudio base image
RiceFarm_dock$FROM("rocker/r-base")

# Create directory in the image for adding the files
RiceFarm_dock$RUN("mkdir /home")

# Copy directory
RiceFarm_dock$COPY(myscript.R /home/analysis/myscript.R)

# Add R packages


# save the Dockerfile
RiceFarm_dock$write()