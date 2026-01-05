FROM --platform=linux/arm/v7 debian:bullseye-slim

# Minimal runtime deps 
RUN apt-get update && apt-get upgrade -y
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates wget python3 \
    libxml2 libxslt1.1 \
 && rm -rf /var/lib/apt/lists/*
RUN wget https://github.com/beaudeanadams/mariner/releases/download/v0.2.1-1/mariner3d_0.2.1-1_armhf.deb
RUN dpkg -i mariner3d_0.2.1-1_armhf.deb

EXPOSE 5000

# Start mariner from /usr/bin/mariner
CMD ["mariner"]
