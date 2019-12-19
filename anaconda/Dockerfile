
# We will use Ubuntu for our image
FROM ubuntu:latest

# Updating Ubuntu packages
RUN apt-get update && yes|apt-get upgrade
RUN apt-get install -y vim

# Adding wget and bzip2
RUN apt-get install -y wget bzip2

# Add sudo
RUN apt-get -y install sudo

# Add user ubuntu with no password, add to sudo group
RUN adduser --disabled-password --gecos '' ubuntu
RUN adduser ubuntu sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER ubuntu
WORKDIR /home/ubuntu/
RUN chmod a+rwx /home/ubuntu/
#RUN echo `pwd`

# Anaconda installing
RUN wget https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh
RUN bash Anaconda3-5.0.1-Linux-x86_64.sh -b
RUN rm Anaconda3-5.0.1-Linux-x86_64.sh

# Set path to conda
#ENV PATH /root/anaconda3/bin:$PATH
ENV PATH /home/ubuntu/anaconda3/bin:$PATH

# Updating Anaconda packages
RUN conda update conda
RUN conda update anaconda
RUN conda update --all

# Configuring access to Jupyter
RUN mkdir /home/ubuntu/notebooks
RUN jupyter notebook --generate-config --allow-root
RUN echo "c.NotebookApp.password = u'sha1:6a3f528eec40:6e896b6e4828f525a6e20e5411cd1c8075d68619'" >> /home/ubuntu/.jupyter/jupyter_notebook_config.py

# Jupyter listens port: 8888
EXPOSE 8888

# Run Jupytewr notebook as Docker main process
CMD ["jupyter", "notebook", "--allow-root", "--notebook-dir=/home/ubuntu/notebooks", "--ip='*'", "--port=8888", "--no-browser"]
# reference: https://hub.docker.com/_/ubuntu/
FROM ubuntu:latest

# Adds metadata to the image as a key value pair example LABEL version="1.0"
LABEL maintainer="WB Hinton <wbhinton@gmail.com>"

# Set environment variables
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8 PATH=/opt/conda/bin:$PATH

# create empty directory to attach volume
RUN mkdir ~/projects 
RUN apt-get update
RUN apt-get install -y wget vim

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
RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org --trusted-host pypi.python.org  pandas_profiling black jupyter_contrib_nbextensions jupyter_nbextensions_configurator feedparser wordcloud nltk scrapy

# Enable Jupyter Notebook extensions
 RUN jupyter contrib nbextension install --user
 RUN jupyter nbextensions_configurator enable --user
 RUN jupyter nbextension enable codefolding/main
 RUN jupyter nbextension enable collapsible_headings/main 

WORKDIR /root/projects
EXPOSE 8888
CMD jupyter lab --no-browser --ip='0.0.0.0' --port=8888 --allow-root --NotebookApp.token='data-science'
