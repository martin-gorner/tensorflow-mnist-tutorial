# Docker

[![asciicast](https://asciinema.org/a/3mlhev87fv926zzcfwxr8rxji.png)](https://asciinema.org/a/3mlhev87fv926zzcfwxr8rxji)


- [docker/Dockerfile](#docker/Dockerfile): tensorflow version CPU

```dockerfile
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
```

- [docker/Dockerfile.gpu](#docker/Dockerfile.gpu): tensorflow version GPU

```dockerfile
# GPU version
FROM gcr.io/tensorflow/tensorflow:latest-gpu
...
```

- [docker/run.sh](#docker/run.sh): Bash script image launcher (designed for execute python scripts in this repository)

```Bash
#!/usr/bin/env bash

# url: https://github.com/thewtex/docker-opengl-nvidia/blob/master/run.sh
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker run \
	-it --rm \
	-v $XSOCK:$XSOCK:rw \
	-v $XAUTH:$XAUTH:rw \
    --device=/dev/dri/card0:/dev/dri/card0 \
	-e DISPLAY=$DISPLAY \
	-e XAUTHORITY=$XAUTH \
	-p 8888:8888 \
	-v `pwd`:/notebooks/sources/ \
	$USER/tensorflow:latest-gpu \
	"$@"
```

- [./makefile](#makefile): Makefile to launch docker container and execute python script tensorflow.

```makefile
# url: http://stackoverflow.com/questions/5193648/automatic-generate-target-from-source-list-make-file

%: %.py
	@./docker/run.sh bash -c "cd sources; python3 ${^}"
```
