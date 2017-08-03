# Start with an existing Jupyter image with some Python libs preinstalled
FROM jupyter/scipy-notebook:9cb6443840b2

# Add the kernel gateway
RUN pip install jupyter_kernel_gateway==0.3.1

# Make the gateway the container entrypoint, put it in HTTP mode, and
# have it listen on all interfaces in the container.
ENTRYPOINT ["tini", "--", "jupyter", "kernelgateway", "--KernelGatewayApp.api=notebook-http", "--KernelGatewayApp.ip=0.0.0.0"]

# Add the scotch notebook
COPY scotch_api_python.ipynb /notebooks/

VOLUME /notebooks

# Tell the kernel gateway to load the scotch notebook by default
CMD ["--KernelGatewayApp.seed_uri=/notebooks/scotch_api_python.ipynb"]