FROM ubuntu:14.04

# We want the "add-apt-repository" command
RUN apt-get update && apt-get install -y software-properties-common

# Install "ffmpeg"
RUN add-apt-repository ppa:mc3man/trusty-media
RUN apt-get update && apt-get install -y ffmpeg

# Configure work area
RUN mkdir /data
WORKDIR /data

# Add a non-root default user
RUN adduser --disabled-password --gecos "" ffmpeg
USER ffmpeg

# Configure container
ENTRYPOINT [ "ffmpeg" ]
CMD [ "-h" ]
