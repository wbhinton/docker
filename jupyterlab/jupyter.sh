docker run --rm -p 10000:8888 -v "$PWD":/home/jovyan/work 303600be7824 jupyter lab --no-browser --ip='0.0.0.0' --port=8888 --allow-root --NotebookApp.token='data-science'
