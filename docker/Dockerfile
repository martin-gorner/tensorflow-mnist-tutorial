# CPU version
FROM tensorflow/tensorflow:latest

# urls: 
# - https://github.com/yoyonel/tensorflow-mnist-tutorial/blob/master/INSTALL.txt
# - http://stackoverflow.com/questions/20360293/how-to-get-ipython-notebook-to-run-python-3
RUN apt-get update && \
	apt-get install -y \
		git \
		python3 \
		python3-matplotlib \
		python3-pip \
		ipython3

RUN pip3 install --upgrade tensorflow

# you might alo need to upgrade matplotlib, the version pulled by
# apt-get is sometimes stale (but comes with the gfx backend)
RUN pip3 install --upgrade matplotlib

# url: http://stackoverflow.com/questions/28831854/how-do-i-add-python3-kernel-to-jupyter-ipython
RUN pip3 install jupyter
# RUN ipython3 kernelspec install-self
# [TerminalIPythonApp] WARNING | Subcommand `ipython kernelspec` is deprecated and will be removed in future versions.
# [TerminalIPythonApp] WARNING | You likely want to use `jupyter kernelspec` in the future
# [InstallNativeKernelSpec] WARNING | `jupyter kernelspec install-self` is DEPRECATED as of 4.0. You probably want `ipython kernel install` to install the IPython kernelspec.
RUN ipython3 kernel install