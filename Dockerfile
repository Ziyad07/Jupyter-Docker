FROM ubuntu:latest
MAINTAINER Ziyad ziyadjappie@gmail.com

RUN apt-get update && apt-get -y update
RUN apt-get install -y python3-pip python3-dev build-essential python3.6
RUN pip3 -q install pip
RUN mkdir scr
COPY . /
WORKDIR /
RUN pip3 install -r requirements.txt
RUN pip3 install jupyter
WORKDIR /notebooks

# Add Tini. Tini operates as a process subreaper for jupyter. This prevents kernel crashes.
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
