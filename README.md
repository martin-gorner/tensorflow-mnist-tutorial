## Tensorflow mnist tutorial

The code companion for the [TensorFlow and Deep Learning without a PhD](https://docs.google.com/presentation/d/1TVixw6ItiZ8igjp6U17tcgoFrLSaHWQmMOwjlgQY9co/pub?slide=id.p) talk, which is a codelab to get started with TensorFlow circumventing some of the underlying theory. 

## Requirements

Python 3 is required for this lab. You may find installation instructions with pip below. Power users with a specific Python environment (virtualenv, anaconda, docker), please visit [tensorflow.org](https://www.tensorflow.org/versions/r0.9/get_started/os_setup.html#requirements).

### MacOS:

* If you do not have it already, [install git](https://git-scm.com/download/mac) 
* Install [the latest version of python 3](https://www.python.org/downloads/)

```
pip3 install --upgrade https://storage.googleapis.com/tensorflow/mac/tensorflow-0.9.0rc0-py3-none-any.whl
pip3 install --upgrade matplotlib
```

### Windows:

*This code lab should work under cygwinX, however it had not been tested, which is why Virtualbox is recommended*

* Install [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
* Create an Linux/Ubuntu virtual machine and [install Ubuntu](http://www.ubuntu.com/download/desktop/)
* **Optional step**: In the virtual machine you may want to install Virtualbox helpers (allows screen resolution changes) using:

```
sudo -H apt-get install virtualbox-guest-additions-iso
sudo -H apt-get install virtualbox-guest-dkms
```

Open the “Additional drivers” app and check that the “Virtualbox Graphics Adapter” and “Virtualbox Guest Service” are selected.

* Shut down the virtual machine, max out its Video RAM and CPU settings, allocate 4GB of RAM and restart.
Now go to the next Ubuntu/Linux section.

### Ubuntu/Linux:

Jumping to code!

```
sudo -H apt-get install git
sudo -H apt-get install python3
sudo -H apt-get install python3-matplotlib
sudo -H apt-get install python3-pip
sudo -H pip3 install --upgrade  https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.9.0rc0-cp35-cp35m-linux_x86_64.whl
```

When testing the installation, if you get an error about “cycler”, please update cycler using:

```
sudo -H pip3 install --upgrade cycler
```

This is caused by a misconfigured dependency in matplotlib and will hopefully be fixed in the next release.

## Test your installation

```
git clone https://github.com/martin-gorner/tensorflow-mnist-tutorial.git
cd tensorflow-mnist-tutorial
python3 mnist_1.0_softmax.py
```

A window should appear displaying a graphical visualization and you should also see training data in the terminal.
