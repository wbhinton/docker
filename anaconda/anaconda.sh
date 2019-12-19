# this will launch the docker container, mount the current working directory to /home/root/projects and start a jupyterlab server.
docker run -it --name=anaconda -p 10000:8888 -v "$PWD":/home/root/projects 05b873d27df0 jupyter lab --no-browser --ip='0.0.0.0' --port=8888 --allow-root --NotebookApp.token='data-science'
