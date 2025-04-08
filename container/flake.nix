{
  description = "Container image with terminal tools and toys";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zeitfetch-src = {
      url = "github:nidnogg/zeitfetch";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    zeitfetch-src,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };

    zeitfetch = pkgs.rustPlatform.buildRustPackage {
      pname = "zeitfetch";
      version = "0.1.14"; # Update with actual version if known
      src = zeitfetch-src;

      cargoLock = {
        lockFile = "${zeitfetch-src}/Cargo.lock";
        outputHashes = {}; # You might need to add the actual hashes if needed
      };

      meta = with pkgs.lib; {
        description = "A minimal fetch program written in Rust";
        homepage = "https://github.com/nidnogg/zeitfetch";
        license = licenses.mit; # Update with the actual license if different
      };
    };

    # Define the package list once to be used in multiple places
    terminalPackages = with pkgs; [
      # aider-chat
      # bashInteractive
      # fastfetch
      # ffmpeg-headless
      # gitMinimal
      # goose-cli
      # htop
      # neofetch
      # tldr
      # vhs
      asciiquarium
      bat
      bottom
      btop
      busybox
      cacert
      cht-sh
      dotacat
      dust
      eza
      fd
      fzf
      figlet
      imagemagick_light
      micro
      miller
      # ncdu
      nnn
      open-adventure
      openssh
      pipes-rs
      # procs
      qrencode
      ripgrep
      sl
      # tealdeer
      tlrc
      # tmux
      # tokei
      tetris
      # visidata
      zeitfetch
      # zellij
      zoxide
    ];
  in {
    packages.${system} = {
      default = self.packages.${system}.docker-image;

      docker-image = pkgs.dockerTools.streamLayeredImage {
        name = "cposc-terminal";
        tag = "latest";

        contents = terminalPackages;

        config = {
          Cmd = ["/bin/sh"];
          WorkingDir = "/";
          env = ["GC_DONT_GC=1"];
        };
      };

      docker-load = pkgs.writeShellScriptBin "docker-load" ''
        set -euo pipefail

        IMAGE_NAME="cposc-terminal"
        IMAGE_TAG="latest"
        FULL_IMAGE_NAME="$IMAGE_NAME:$IMAGE_TAG"

        echo "Removing existing Docker image if it exists..."
        if docker image inspect "$FULL_IMAGE_NAME" &>/dev/null; then
          docker rmi "$FULL_IMAGE_NAME" || echo "Warning: Failed to remove existing image"
        fi

        echo "Building and loading Docker image directly..."
        # streamLayeredImage outputs the image when executed, pipe directly to docker load
        image_path=$(nix build .#docker-image --print-out-paths --no-link)

        "$image_path" | docker load

        if [ $? -eq 0 ]; then
          echo "Image loaded successfully!"
          echo "You can now use: docker run -it $FULL_IMAGE_NAME"
        else
          echo "Failed to load the Docker image"
          exit 1
        fi
      '';

      analyze-image-size = let
        pythonEnv = pkgs.python3.withPackages (ps: with ps; [humanfriendly]);
        scriptPath = toString ./analyze_image_size.py;
      in
        pkgs.writeShellScriptBin "analyze-image-size" ''
          ${pythonEnv}/bin/python ${scriptPath} \
            ${self.packages.${system}.docker-image} \
            ${builtins.concatStringsSep " " (map toString terminalPackages)}
        '';

      analyze-deps = pkgs.writeShellScriptBin "analyze-deps" ''
        nix path-info -rsSh $(nix-build -A packages.${system}.docker-image)
      '';

      # Add a publish script for Docker Hub
      publish-to-dockerhub = pkgs.writeShellScriptBin "publish-to-dockerhub" ''
        set -e
        docker load < ${self.packages.${system}.docker-image}
        docker tag cposc-terminal:latest ''${DOCKER_USERNAME:-yourusername}/cposc-terminal:latest
        docker push ''${DOCKER_USERNAME:-yourusername}/cposc-terminal:latest
      '';

      # Add a publish script for GitHub Container Registry
      publish-to-ghcr = pkgs.writeShellScriptBin "publish-to-ghcr" ''
        set -e
        docker load < ${self.packages.${system}.docker-image}
        docker tag cposc-terminal:latest ghcr.io/''${GITHUB_USERNAME:-yourusername}/cposc-terminal:latest
        docker push ghcr.io/''${GITHUB_USERNAME:-yourusername}/cposc-terminal:latest
      '';
    };
  };
}
