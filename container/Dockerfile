# Stage 1: Build qrencode from source
FROM alpine:edge AS c-builder

# Install build dependencies
RUN apk add --no-cache \
    autoconf \
    automake \
    build-base \
    cmake \
    git \
    libpng \
    libpng-dev \
    libtool \
    ncurses-dev \
    pkgconf \
    zlib-dev

# Clone and build libqrencode
WORKDIR /tmp
RUN git clone https://github.com/fukuchi/libqrencode.git && \
    cd libqrencode && \
    cmake . && \
    make && \
    make install

RUN git clone https://github.com/townba/bocfel && \
    cd bocfel && \
    make GLK=

# Stage 2: Build dotacat from source
FROM rust:alpine AS rust-builder

# Install build dependencies
RUN apk add --no-cache \
    build-base \
    libc-dev \
    pkgconf

# Build dotacat using cargo
WORKDIR /tmp
RUN cargo install dotacat --version "0.3.0" --root /usr/local
RUN cargo install tealdeer --root /usr/local

# Stage 3: Final image
FROM alpine:edge

# Copy artifacts from c-builder stage
COPY --from=c-builder /usr/local/bin/qrencode /usr/bin/
# COPY --from=c-builder /usr/local/lib/libqrencode.so* /usr/lib/
COPY --from=c-builder /tmp/bocfel/bocfel /usr/bin/

# Copy artifacts from rust builder stage
COPY --from=rust-builder /usr/local/bin/dotacat /usr/bin/
COPY --from=rust-builder /usr/local/bin/tldr /usr/bin/

# Update system and install base packages
RUN apk update && apk upgrade && \
    apk add --no-cache \
    asciiquarium \
    bottom \
    bsd-games \
    dust \
    eza \
    fastfetch \
    fd \
    ffmpeg \
    figlet \
    fzf \
    imagemagick \
    libpng \
    micro \
    micro-tetris \
    miller \
    nnn \
    openssh-client \
    ripgrep \
    sl \
    zoxide && \
    # ldconfig /usr/local/lib || true && \
    wget -O /root/zork1.z3 https://eblong.com/infocom/gamefiles/zork1-r119-s880429.z3 && \
    wget -O /root/gourmet.zblorb https://ifarchive.org/if-archive/games/zcode/gourmet.zblorb && \
    rm -rf /var/cache/apk/*

ENV COLORTERM=truecolor
# Set a default command (can be overridden)
CMD ["/bin/sh"]
