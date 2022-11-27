# syntax=docker/dockerfile:1

# Build an image starting with the Python 3.10.7 image
FROM python:3 as builder

# Add metadata how to contact the maintainer
LABEL maintainer="a.khusnutdinova@innopolis.university"

# Install gcc and other dependencies and create a non-root user
RUN apt-get update \
    && apt-get -y install rabbitmq-server \
    && service rabbitmq-server restart

# RUN services start rabbitmq

# ENV PATH="$PATH:/usr/local/sbin"

# Copy requirements.txt and install the Python dependencies
COPY requirements.txt requirements.txt
RUN pip3 install --no-cache-dir wheel -r requirements.txt

# Add metadata that the container is listening on port 8000
EXPOSE 5672

# Copy the current directory . in the project to the workdir .
COPY . .

# Set the default command for the container
CMD [ "python3", "receive.py"]