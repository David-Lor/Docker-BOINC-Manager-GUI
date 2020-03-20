ARG IMAGE_TAG="ubuntu-18.04"

FROM jlesage/baseimage-gui:${IMAGE_TAG}
ARG APP_ICON="https://boinc.berkeley.edu/logo/boinc128.bmp"
ENV APP_NAME="BOINC Manager"

RUN install_app_icon.sh "${APP_ICON}"

RUN apt-get -yq update && \
    apt-get -yq install boinc-manager && \
    apt-get -yq autoremove && \
    rm -rf /var/lib/apt/lists/*

COPY startapp.sh /startapp.sh
VOLUME /config
