FROM ubuntu:latest

# Adds metadata to the image as a key value pair example LABEL version="1.0"
LABEL maintainer="WB Hinton <wbhinton@gmail.com>"

# Set environment variables
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8 PATH=/opt/conda/bin:$PATH

# create empty directory to attach volume
RUN mkdir ~/projects
RUN apt-get update
RUN apt-get install -y wget vim fonts-firacode

RUN apt-get clean
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh
# Install Anaconda
# Make sure to update the download link or the scrip will fail.
RUN wget --quiet --no-check-certificate https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh -O ~/anaconda.sh
RUN bash ~/anaconda.sh -b -p /opt/conda
RUN rm ~/anaconda.sh

# Update Anaconda
RUN conda config --set ssl_verify no
RUN conda update conda
RUN conda update anaconda
RUN conda update --all
# Install modules
RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org --trusted-host pypi.python.org  pandas_profiling black jupyter_contrib_nbextensions jupyter_nbextensions_configurator feedparser wordcloud nltk scrapy kaggle

# Enable Jupyter Notebook extensions
 RUN jupyter contrib nbextension install --user
 RUN jupyter nbextensions_configurator enable --user
 RUN jupyter nbextension enable codefolding/main
 RUN jupyter nbextension enable collapsible_headings/main
# Add kaggle API you need to have a folder named 'kaggle' with the kaggle.json api
ADD ../secrets/kaggle $HOME/.kaggle
WORKDIR /root/projects
#EXPOSE 8888
#CMD jupyter lab --no-browser --ip='0.0.0.0' --port=8888 --allow-root --NotebookApp.token='data-science'
