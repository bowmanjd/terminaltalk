# Publishing Docker Images

You can publish your Docker image to various container registries after building it with Nix.

## 1. Publishing to Docker Hub

After building your Docker image with Nix, follow these steps to publish it to Docker Hub:

1. **Log in to Docker Hub**:
   ```bash
   docker login
   ```
   You'll be prompted to enter your Docker Hub username and password.

2. **Tag the image with your Docker Hub username**:
   ```bash
   # After loading the image
   docker load < result
   
   # Tag with your username
   docker tag dotacat-bsdgames:latest yourusername/dotacat-bsdgames:latest
   ```

3. **Push the image to Docker Hub**:
   ```bash
   docker push yourusername/dotacat-bsdgames:latest
   ```

4. **Optional: Add additional tags**:
   ```bash
   # Add a version tag
   docker tag dotacat-bsdgames:latest yourusername/dotacat-bsdgames:v1.0
   docker push yourusername/dotacat-bsdgames:v1.0
   ```

## 2. Publishing to GitHub Container Registry (GHCR)

1. **Log in to GitHub Container Registry**:
   ```bash
   # Create a Personal Access Token (PAT) with appropriate permissions in GitHub
   # Then use it to log in
   echo $GITHUB_TOKEN | docker login ghcr.io -u USERNAME --password-stdin
   ```

2. **Tag the image for GHCR**:
   ```bash
   # After loading the image
   docker load < result
   
   # Tag with your GitHub username or organization
   docker tag dotacat-bsdgames:latest ghcr.io/yourusername/dotacat-bsdgames:latest
   ```

3. **Push the image to GHCR**:
   ```bash
   docker push ghcr.io/yourusername/dotacat-bsdgames:latest
   ```

## 3. Publishing to GitLab Container Registry

1. **Log in to GitLab Container Registry**:
   ```bash
   # Using personal access token
   docker login registry.gitlab.com -u yourusername -p your_access_token
   ```

2. **Tag the image for GitLab**:
   ```bash
   # After loading the image
   docker load < result
   
   # Tag with your GitLab project path
   docker tag dotacat-bsdgames:latest registry.gitlab.com/yourusername/yourproject/dotacat-bsdgames:latest
   ```

3. **Push the image to GitLab**:
   ```bash
   docker push registry.gitlab.com/yourusername/yourproject/dotacat-bsdgames:latest
   ```

## 4. Publishing to a Private Docker Registry

1. **Log in to your private registry**:
   ```bash
   docker login your-registry.example.com -u username -p password
   ```

2. **Tag the image for your private registry**:
   ```bash
   # After loading the image
   docker load < result
   
   # Tag with your private registry domain
   docker tag dotacat-bsdgames:latest your-registry.example.com/dotacat-bsdgames:latest
   ```

3. **Push the image to your private registry**:
   ```bash
   docker push your-registry.example.com/dotacat-bsdgames:latest
   ```

## 5. Streamlining with Nix

You can also automate this process by modifying your flake.nix to include scripts for publishing. Here's an example addition to your flake:

```nix
{
  # ... existing flake code ...
  
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system} = {
        # ... existing packages ...
        
        # Add a publish script
        publish-to-dockerhub = pkgs.writeShellScriptBin "publish-to-dockerhub" ''
          set -e
          docker load < ${self.packages.${system}.docker-image}
          docker tag dotacat-bsdgames:latest ''${DOCKER_USERNAME:-yourusername}/dotacat-bsdgames:latest
          docker push ''${DOCKER_USERNAME:-yourusername}/dotacat-bsdgames:latest
        '';
      };
    };
}
```

You would then run: `nix run .#publish-to-dockerhub`