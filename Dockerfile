FROM debian:bullseye-slim

ENV NODE_OPTIONS=--dns-result-order=ipv4first \
    PYTHONUNBUFFERED=1

# Minimal runtime deps (no -dev!)
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates wget \
 && rm -rf /var/lib/apt/lists/*
RUN wget https://github.com/beaudeanadams/mariner/releases/download/v0.2.1-1/mariner3d_0.2.1-1_armhf.deb
RUN dpkg -i mariner3d_0.2.1-1_armhf.deb

EXPOSE 5000

# Start mariner from /usr/bin/mariner
CMD ["mariner"]
