FROM debian:bullseye-slim

ENV NODE_OPTIONS=--dns-result-order=ipv4first \
    PYTHONUNBUFFERED=1

# Minimal runtime deps (no -dev!)
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates curl wget \
    gcc libc6-dev libcap-dev python3-dev \
    python3 python3-venv python3-distutils \
    libpcap0.8 \
    libssl1.1 \
    libxml2 libxslt1.1 \
    libjpeg62-turbo libwebp6 libtiff5 libpng16-16 libfreetype6 zlib1g \
    libatlas3-base liblapack3 libgfortran5 \
    libavcodec58 libavformat58 libavutil56 libswscale5 libswresample3 \
    libdrm2 libxcb1 libxau6 libasound2 \
 && rm -rf /var/lib/apt/lists/*
RUN wget https://github.com/beaudeanadams/mariner/releases/download/v0.2.1-1/mariner3d_0.2.1-1_armhf.deb
RUN dpkg -i mariner3d_0.2.1-1_armhf.deb

EXPOSE 5000

# Start mariner from /usr/bin/mariner
CMD ["mariner"]
