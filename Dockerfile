# BASE IMAGE
FROM continuumio/anaconda3:latest

# Maintainer
MAINTAINER tomekcp 


RUN pip install xeus-python ptvsd
RUN pip install PuCo


RUN /opt/conda/bin/conda install jupyterlab -y --quiet
RUN /opt/conda/bin/conda install  nodejs
RUN /opt/conda/bin/conda install -c conda-forge jupyter-lsp
RUN /opt/conda/bin/conda install -c conda-forge jupyterlab-git
RUN /opt/conda/bin/conda install -c conda-forge ipywidgets
RUN /opt/conda/bin/conda install -c conda-forge jupyterlab mamba_gator

RUN /opt/conda/bin/jupyter notebook --generate-config

RUN /opt/conda/bin/jupyter labextension install @krassowski/jupyterlab-lsp --dev-build=true --minimize=False
RUN /opt/conda/bin/conda install python-language-server
RUN /opt/conda/bin/jupyter labextension install @telamonian/theme-darcula --dev-build=true --minimize=False
RUN /opt/conda/bin/jupyter labextension install @jupyterlab/debugger --dev-build=true --minimize=False
RUN /opt/conda/bin/jupyter labextension install @jupyter-widgets/jupyterlab-manager@2.0 --dev-build=true --minimize=False
RUN /opt/conda/bin/jupyter labextension install @jupyterlab/toc  --dev-build=true --minimize=False
RUN /opt/conda/bin/jupyter labextension install @mamba-org/gator-lab --dev-build=true --minimize=False
RUN /opt/conda/bin/jupyter labextension install jupyterlab-tabular-data-editor --dev-build=true --minimize=False

RUN /opt/conda/bin/jupyter lab build --dev-build=true --minimize=False

RUN mkdir /opt/notebooks

EXPOSE 8080

CMD /opt/conda/bin/jupyter-lab  --ip='0.0.0.0' --allow-root --port=8080 --no-browser

