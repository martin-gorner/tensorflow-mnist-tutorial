## Tensorflow mnist tutorial

The code companion for the [TensorFlow and Deep Learning without a PhD](https://docs.google.com/presentation/d/1TVixw6ItiZ8igjp6U17tcgoFrLSaHWQmMOwjlgQY9co/pub?slide=id.p) talk, which is a codelab to get started with TensorFlow circumventing some of the underlying theory. 

## Requirements

Python 3 is required for this lab. Please follow [the installation instructions on tensorflow.org](https://www.tensorflow.org/versions/r0.9/get_started/os_setup.html#requirements).

Extra libraries required for the lab (Ubuntu):

```
sudo apt-get install python-dev libffi-dev
sudo pip3 install matplotlib cairocffi
```

To test your installation:

```
git clone https://github.com/martin-gorner/tensorflow-mnist-tutorial.git
cd tensorflow-mnist-tutorial
python3 mnist_1.0_softmax.py
```

A window should appear displaying a graphical visualization and you should also see training data in the terminal.
