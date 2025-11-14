FROM mcr.microsoft.com/devcontainers/base:noble
WORKDIR /home

RUN apt update \
    && apt -y install \
        python3-venv \
        r-base \
        r-base-dev \
        r-cran-dplyr \
        r-cran-ggplot2 \
        r-cran-ggrepel \
        r-cran-patchwork \
        r-cran-rcolorbrewer \
        r-cran-rmarkdown \
        r-cran-tidyr \
        r-cran-vegan \
        r-cran-plotly \
    && ln -s /usr/bin/python3 /usr/bin/python

# Install extra R packages and IRkernel
COPY install_packages.R /tmp/install_packages.R

# Install IRkernel + register it
RUN R -e "install.packages('IRkernel'); IRkernel::installspec(user = FALSE)" \
    && Rscript /tmp/install_packages.R \
    && rm /tmp/install_packages.R
