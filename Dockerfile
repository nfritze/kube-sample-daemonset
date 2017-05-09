FROM ubuntu

RUN apt-get update &&\
    apt-get install -y openssh-client &&\
    apt-get upgrade -y &&\
    apt-get clean

RUN mkdir /unrootsquash
WORKDIR /unrootsquash

ADD unrootsquash.sh /unrootsquash/unrootsquash.sh
RUN chmod 700 /unrootsquash/unrootsquash.sh

CMD bash -c /unrootsquash/unrootsquash.sh

