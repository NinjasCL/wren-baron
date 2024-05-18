FROM ubuntu:13.04

RUN sed -i 's/archive.ubuntu/old-releases.ubuntu/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install build-essential -y

COPY . /wrenc

WORKDIR /wrenc/projects/make/
RUN make config=release_64bit

RUN /wrenc/bin/wrenc -v

# So we can execute commands
# and do not exits
CMD tail -f /dev/null
