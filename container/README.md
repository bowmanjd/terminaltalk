# Dotacat and BSDGames Docker Container Flake

This Nix flake builds a Docker container with [dotacat](https://github.com/nekowinston/dotacat) and [bsdgames](https://wiki.linuxquestions.org/wiki/BSD_games) pre-installed.

## Requirements

- [Nix](https://nixos.org/) with flakes enabled
- Docker (if you want to run the container)

## Building the Docker image

To build the Docker image, run:

```bash
nix build
```

This will create a `result` symlink to the Docker image tarball.

## Loading the Docker image

To load the image into Docker, run:

```bash
docker load < result
```

## Running the container

After loading the image, you can run the container with:

```bash
docker run -it dotacat-bsdgames:latest
```

## Available games

Once inside the container, you can run:

- `dotacat` - A pretty cat alternative
- Various BSD games like `adventure`, `battlestar`, `tetris-bsd`, etc.

## Publishing the Image

This flake includes scripts to help publish the Docker image to registries:

```bash
# Publish to Docker Hub (sets username from env var or uses default)
DOCKER_USERNAME=yourusername nix run .#publish-to-dockerhub

# Publish to GitHub Container Registry 
GITHUB_USERNAME=yourusername nix run .#publish-to-ghcr
```

For more detailed publishing instructions, see the [PUBLISHING.md](PUBLISHING.md) file.

## Customizing the flake

You can modify the `flake.nix` file to add or remove packages as needed.