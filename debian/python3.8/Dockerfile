FROM python:3.8.0-buster

# Install required packages
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y build-essential  \
    libreadline-gplv2-dev \
    libncursesw5-dev \
    libssl-dev \
    libsqlite3-dev \
    tk-dev \
    libgdbm-dev \
    libc6-dev \
    libbz2-dev \
    zlib1g-dev \
    openssl \
    libffi-dev \
    python3-dev \
    python3-setuptools \
    wget

# Install Jupyter
RUN pip install jupyter
RUN pip install ipywidgets
RUN jupyter nbextension enable --py widgetsnbextension

# Install JupyterLab
RUN pip install jupyterlab && jupyter serverextension enable --py jupyterlab

ENV LANG=C.UTF-8

# Install Python Packages & Requirements (Done near end to avoid invalidating cache)
# COPY requirements.txt requirements.txt
# RUN pip install -r requirements.txt

ENV MAIN_PATH=/usr/local/bin/jlab
ENV LIBS_PATH=${MAIN_PATH}/libs
ENV CONFIG_PATH=${MAIN_PATH}/config
ENV NOTEBOOK_PATH=${MAIN_PATH}/notebooks

# Install miniconda to /miniconda
# RUN curl -LO http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
# RUN bash Miniconda3-latest-Linux-x86_64.sh -p /miniconda -b
# RUN rm Miniconda3-latest-Linux-x86_64.sh
# ENV PATH=/miniconda/bin:${PATH}
# RUN conda update -y conda

# Expose Jupyter port & cmd
EXPOSE 8888
RUN mkdir -p /opt/app/data
CMD jupyter lab --ip=* --port=8888 --no-browser --notebook-dir=/opt/app/data --allow-root
