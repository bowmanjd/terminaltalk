{
  description = "Container image with terminal tools and toys";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
    # Define the package list once to be used in multiple places
    terminalPackages = with pkgs; [
      tetris
      figlet
      pipes-rs
      sl
      asciiquarium
      # aider-chat
      bashInteractive
      bat
      # bsdgames
      btop
      dotacat
      eza
      fd
      gitMinimal
      # goose-cli
      htop
      imagemagick
      inetutils
      ffmpeg
      ncdu
      neofetch
      nnn
      openssh
      ripgrep
      tldr
      # vhs
    ];
  in {
    packages.${system} = {
      default = self.packages.${system}.docker-image;

      docker-image = pkgs.dockerTools.buildImage {
        name = "cposc-terminal";
        tag = "latest";

        copyToRoot = pkgs.buildEnv {
          name = "image-root";
          paths = terminalPackages;
          pathsToLink = ["/bin"];
        };

        config = {
          Cmd = ["/bin/bash"];
          WorkingDir = "/";
        };
      };

      analyze-image-size = pkgs.runCommand "analyze-image-size" {
        buildInputs = [ pkgs.python3 ];
        # Read the Python script content
        pythonScript = builtins.readFile ./analyze_image_size.py;
      } ''
        mkdir -p $out/bin
        cat > $out/bin/analyze-image-size << EOF
        ${builtins.replaceStrings 
          ["__IMAGE_PATH__" "__PACKAGES__"] 
          ["${self.packages.${system}.docker-image}" 
           "${builtins.toJSON (map toString terminalPackages)}"]
          "$pythonScript"}
        EOF
        chmod +x $out/bin/analyze-image-size
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
