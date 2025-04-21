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

# build libqrencode
WORKDIR /tmp
RUN git clone https://github.com/fukuchi/libqrencode.git && \
    cd libqrencode && \
    cmake . && \
    make && \
    make install

# build bocfel
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

# Build using cargo
WORKDIR /tmp
RUN cargo install dotacat --version "0.3.0" --root /usr/local
RUN cargo install tealdeer --root /usr/local
RUN cargo install ttyper --root /usr/local

# Stage 3: Build Go tools
FROM golang:alpine AS go-builder

# Install build dependencies if needed
RUN apk add --no-cache git

# Build glow
WORKDIR /go
RUN go install github.com/charmbracelet/glow@latest

# Last Stage: Final image
FROM alpine:edge

# Copy artifacts from c-builder stage
COPY --from=c-builder /usr/local/bin/qrencode /usr/bin/
COPY --from=c-builder /tmp/bocfel/bocfel /usr/bin/

# Copy artifacts from rust builder stage
COPY --from=rust-builder /usr/local/bin/dotacat /usr/bin/
COPY --from=rust-builder /usr/local/bin/tldr /usr/bin/
COPY --from=rust-builder /usr/local/bin/ttyper /usr/bin/

# Copy artifacts from go builder stage
COPY --from=go-builder /go/bin/glow /usr/bin/

# Update system and install base packages
RUN apk update && apk upgrade && \
    apk add --no-cache \
    asciiquarium \
    bat \
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
    openssh-client \
    py3-rich \
    ripgrep \
    sl \
    tty-solitaire \
    zoxide && \
    # ldconfig /usr/local/lib || true && \
    wget -O /root/zork1.z3 https://eblong.com/infocom/gamefiles/zork1-r119-s880429.z3 && \
    wget -O /root/gourmet.zblorb https://ifarchive.org/if-archive/games/zcode/gourmet.zblorb && \
    mkdir -p /root/.ssh && \
    echo '[telehack.com]:2222 ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMYDtEuPGGD6Rj+MKP8dHmBS9NaFkq7IXRSuZqsQp6eO' > /root/.ssh/known_hosts && \
    chmod 600 /root/.ssh/known_hosts && \
    mkdir -p /usr/share/dict && \
    printf "apple\nbeach\ncloud\ndiamond\neagle\nforest\ngarden\nharbor\nisland\njungle\nkitchen\nlibrary\nmountain\nnature\nocean\npicnic\nquiet\nriver\nsunset\ntable\numbrella\nvillage\nwinter\nyellow\nzebra" > /usr/share/dict/words && \
    printf '#!/bin/sh\n\nalias ls="eza"\nalias cat="bat --paging=never"\neval "$(zoxide init posix --hook prompt --cmd cd)"\n' > /etc/profile.d/cposc.sh && \
    chmod +x /etc/profile.d/cposc.sh && \
    rm -rf /var/cache/apk/*

COPY README.md /root/

ENV COLORTERM=truecolor
# Set a default command (can be overridden)
CMD ["/bin/sh", "-c", "glow -p /root/README.md; sh"]
