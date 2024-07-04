# Author: Michael Bopp
# Filename: Dockerfile
# Description: Dockerfile for Ada Stuff.
# Date Created: 07/04/24
# Last Edited: 87/04/24

# Use Debian as the base image
FROM debian:latest

# Install Busybox, GNAT Ada, Neovim, Python, Vim, & Make
RUN apt-get update && apt-get install -y \
    busybox \
    gnat \
    neovim \
    python3 \
    vim \
    make \
    && apt-get clean

# Optional: Set the working directory to your Go workspace
WORKDIR workspace

EXPOSE 80