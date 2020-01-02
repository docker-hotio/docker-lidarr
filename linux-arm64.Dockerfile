FROM hotio/mono@sha256:d4f968d114fa3403b578ea8c354d586e5e54ec05e2b8e67d18e390734973c3e6

ARG DEBIAN_FRONTEND="noninteractive"

EXPOSE 8686

# install packages
RUN apt update && \
    apt install -y --no-install-recommends --no-install-suggests \
        libchromaprint-tools && \
# clean up
    apt autoremove -y && \
    apt clean && \
    rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

# https://github.com/lidarr/Lidarr/releases
ARG LIDARR_VERSION=0.7.1.1381

# install app
RUN curl -fsSL "https://github.com/lidarr/Lidarr/releases/download/v${LIDARR_VERSION}/Lidarr.master.${LIDARR_VERSION}.linux.tar.gz" | tar xzf - -C "${APP_DIR}" --strip-components=1 && \
    chmod -R u=rwX,go=rX "${APP_DIR}"

COPY root/ /
