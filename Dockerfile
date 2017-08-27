FROM tensorflow/tensorflow:latest

MAINTAINER CuongQuay <cuong3ihut@gmail.com>

# Set up our notebook config.
COPY jupyter_notebook_config.py /root/.jupyter/

# Copy sample notebooks.
COPY notebooks /notebooks

# Jupyter has issues with being run directly:
#   https://github.com/ipython/ipython/issues/7062
# We just add a little wrapper script.
COPY run_jupyter.sh /
RUN chmod +x /run_jupyter.sh

# Install latest stable dependancies
RUN pip --no-cache-dir install requests simplejson boto3 uuid
        
# TensorBoard
EXPOSE 6006
# IPython
EXPOSE 8888

WORKDIR /notebooks
VOLUME /notebooks

CMD ["/run_jupyter.sh", "--allow-root"]