# Reproducible Research Example

This is an small example to create a LaTeX document using python and PythonTex inside a Docker container from a linux host.

For great resources on how to do reproducible research with Python see the videos from the scipy conference and their git repositories:

- [Reproducible Documents with PythonTeX; SciPy 2013 Presentation](https://www.youtube.com/watch?v=G-UDHc2UVOg) by Geoffre Poore (https://github.com/gpoore/pythontex).

- [Dexy and Docker for Scientific Reproducibility](https://www.youtube.com/watch?v=qFd04rA8lp0) by Ana Nelson. (https://github.com/ananelson/scipy2015)

- [Reproducible Science: Walking the Walk](https://youtu.be/EzX7MN_bzqg?list=PLIyfHkjEDSOEBhovULDAQtVje6toLVhP_) by Matthew McCormick et al. (https://github.com/reproducible-research/scipy-tutorial-2014).

- [Docker for Improved Reproducibility of Scientific Python Analyses ](https://www.youtube.com/watch?v=7gwCsQJKWJY) by Matthew McCormick.


## Building the Docker Image

This is build from the instruction given in the file called *Dockerfile*. 

`docker build -t manuelmarcano22/reproducible`

This will create a container with an Ubuntu machine with the necessary packages.

## Running Docker

We can launch the image and open a shell with the  flags `-i -t`. 

`docker run -i -t manuelmarcano22/reproducible /bin/bash`

But we need a few extra options and use `xhost` to be able to see the pdf. 

The list of commands can be run executing the file *run-docker.sh*. 

`bash run-docker.sh` 

or
```bash
chmod +x run-docker.sh
./run-docker.sh
```

## Building the pdf with latexmk and PythonTex

We need to change to the folder *documents* and then use `latexmk`

```bash
cd documents
sudo latexmk -r latexmkrc -pdf astropyexample.tex
```

The `-r` flag is telling latexmk to use an specific configuration file.


astropyexample is a section of  a [.tex file](https://gist.github.com/Cadair/5f66da0c4d14055836b2) created by [Stuard Mumford](https://github.com/Cadair) showing a few functionalities of PythonTex with astropy. This will create a pdf called *astropyexample.pdf*.  For a more detalied example see the [PythonTeX repository](https://github.com/gpoore/pythontex) and the gallery.

To see the pdf just do `evince astropyexample.pdf`.

## Copy file from container to the host

To copy the produced files to the host just do:

`docker cp <containerId>:/file/path/within/container /host/path/target`

## Exiting the Docker

to exit just type *exit*


## To-Do
- ~~Find a safer way than just doing xhost x to display the pdf.~~ Used `xhost +local`. Should be a bit better. Other ways to do it are listed [here](http://wiki.ros.org/docker/Tutorials/GUI)
- Figure out why is needed to execute as sudo latexmk. 
