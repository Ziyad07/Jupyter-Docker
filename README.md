# Jupyter-Docker. Run the following commands

## This following command will build the docker image. The -t is the tag associated with the image and named jupyterdocker. The . is to declare the pwd where the docker file is located

`sudo docker build -t jupyterdocker .`

### This will take some time to build so be patient

# For stateless docker machines

## Once the docker machine is built you can run the following to start the docker image.

`sudo docker run -p 8888:8888`

# To preserve state of docker machines
## Note: Data in containers is not persistent, so as soon as you quit running the container AND remove the container, the data goes with it. 
## https://www.reddit.com/r/docker/comments/6ltn29/noob_q_how_do_i_save_my_work_done_on_docker/

## To persist work done in the jupyter notebook run the following command

'sudo docker run -p 8888:8888 -v 'pwd'/notebooks:/notebooks -it jupyterdocker'

## where 'pwd' is the directory where you cloned the repo. The -v command is to mount the state locally
