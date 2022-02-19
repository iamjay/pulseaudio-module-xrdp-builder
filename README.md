# Overview
This repo is a helper to build pulseaudio-module-xrdp for Ubuntu according to instructions available at https://github.com/neutrinolabs/pulseaudio-module-xrdp/wiki/Build-on-Debian-or-Ubuntu.

# How to use
DOCKER_BUILDKIT=1 docker build --target export-output --output type=tar,dest=out.tar .
