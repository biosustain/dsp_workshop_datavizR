FROM mcr.microsoft.com/devcontainers/base:noble
WORKDIR /home

RUN apt update \
    && apt -y install \
        python3-venv \
        python3-pip \
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

# --- Install Jupyter for IRkernel ---
RUN pip install --no-cache-dir \
        jupyter \
        jupyter_client \
        jupyter_core \
        notebook

# Install R packages from your script + IRkernel
COPY install_packages.R /tmp/install_packages.R

RUN R -e "install.packages('IRkernel'); IRkernel::installspec(user = FALSE)" \
    && Rscript /tmp/install_packages.R \
    && rm /tmp/install_packages.R
