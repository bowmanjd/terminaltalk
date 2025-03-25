{
  description = "Docker container with dotacat and bsdgames";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system} = {
        default = self.packages.${system}.docker-image;
        
        docker-image = pkgs.dockerTools.buildImage {
          name = "dotacat-bsdgames";
          tag = "latest";
          
          copyToRoot = pkgs.buildEnv {
            name = "image-root";
            paths = [
              pkgs.dotacat
              pkgs.bsdgames
              pkgs.bashInteractive
              pkgs.coreutils
            ];
            pathsToLink = [ "/bin" ];
          };
          
          config = {
            Cmd = [ "/bin/bash" ];
            WorkingDir = "/";
          };
        };
        
        # Add a publish script for Docker Hub
        publish-to-dockerhub = pkgs.writeShellScriptBin "publish-to-dockerhub" ''
          set -e
          docker load < ${self.packages.${system}.docker-image}
          docker tag dotacat-bsdgames:latest ''${DOCKER_USERNAME:-yourusername}/dotacat-bsdgames:latest
          docker push ''${DOCKER_USERNAME:-yourusername}/dotacat-bsdgames:latest
        '';
        
        # Add a publish script for GitHub Container Registry
        publish-to-ghcr = pkgs.writeShellScriptBin "publish-to-ghcr" ''
          set -e
          docker load < ${self.packages.${system}.docker-image}
          docker tag dotacat-bsdgames:latest ghcr.io/''${GITHUB_USERNAME:-yourusername}/dotacat-bsdgames:latest
          docker push ghcr.io/''${GITHUB_USERNAME:-yourusername}/dotacat-bsdgames:latest
        '';
      };
    };
}