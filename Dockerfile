FROM ubuntu:21.10 AS build-stage

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y build-essential dpkg-dev libpulse-dev git autoconf libtool sudo debootstrap schroot lsb-release \
    && rm -rf /var/lib/apt/lists/*

COPY pulseaudio-module-xrdp /pulseaudio-module-xrdp
WORKDIR /pulseaudio-module-xrdp
RUN scripts/install_pulseaudio_sources_apt.sh -d /pulseaudio.src \
    && ./bootstrap && ./configure PULSE_DIR=/pulseaudio.src \
    && make && DESTDIR=/tmp/output make install

FROM scratch AS export-output
COPY --from=build-stage /tmp/output /
