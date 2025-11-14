FROM mcr.microsoft.com/devcontainers/base:noble
WORKDIR /home

# --- System packages & R ---
RUN apt update \
    && apt -y install \
        r-base \
        r-base-dev \
        libxml2-dev \
        libcurl4-openssl-dev \
        libssl-dev \
        r-cran-dplyr \
        r-cran-ggplot2 \
        r-cran-ggrepel \
        r-cran-patchwork \
        r-cran-rcolorbrewer \
        r-cran-rmarkdown \
        r-cran-tidyr \
        r-cran-vegan \
        r-cran-plotly

# --- Install Jupyter for IRkernel ---
RUN pip install --no-cache-dir \
        jupyter \
        jupyter_client \
        jupyter_core \
        notebook

# --- Install IRkernel ---
RUN R -e "install.packages('IRkernel', repos='https://cloud.r-project.org'); IRkernel::installspec(user = FALSE)"

# --- Copy and install your R packages safely ---
COPY install_packages.R /tmp/install_packages.R
RUN Rscript -e "options(repos='https://cloud.r-project.org'); try(source('/tmp/install_packages.R'), silent=TRUE)" \
    && rm /tmp/install_packages.R
