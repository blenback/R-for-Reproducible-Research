FROM rocker/r-ver:4.3.1
MAINTAINER Your_name <Your_email>
MAINTAINER Your_name <Your_email>
COPY /Data /home
COPY /Scripts /home
COPY /RiceFarm_master.R /home
RUN R -e 'install.packages("ggplot2")'
RUN R -e 'install.packages("stringr")'
CMD Rscript /home/RiceFarm_master.R 
