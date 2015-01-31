#!/bin/bash

set +e

# Check if blog_green is running
docker port blog_green 2368

if [ $? -ne 0 ]; then  
  echo "Currently active node is blog_blue, deploying blog_green"
  docker rm blog_green
  docker run -e PAGESPEED=1 -e VIRTUAL_HOST=ce.ms --volumes-from blogVolume --name blog_green -d -p 42420:2368 -v ~/blog:/ghost-override dockerfile/ghost
  sleep 20
  docker stop blog_blue
else  
  echo "Currently active node is blog_green, deploying blog_blue"
  docker rm blog_blue
  docker run -e PAGESPEED=1 -e VIRTUAL_HOST=ce.ms --volumes-from blogVolume --name blog_blue -d -p 42420:2368 -v ~/blog:/ghost-override dockerfile/ghost
  sleep 20
  docker stop blog_green
fi
