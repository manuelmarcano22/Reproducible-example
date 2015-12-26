set -e

### "build"
export USERNAME=reproducibile
export IMAGENAME=base
docker build -t $USERNAME/$IMAGENAME .

### Run the container and mount your documents

# To use evince ann see the pdf in a docker container from a  linux host.

#xhost +  #Easiest but not safest way. 
docker run -it \
	-e DISPLAY \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	$USERNAME/$IMAGENAME /bin/bash

xhost +local:`docker inspect --format='{{ .Config.Hostname }}' $containerId`
docker start $containerID

#run 'xhost -' after finsishing working with the container.
