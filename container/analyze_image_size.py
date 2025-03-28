#!/usr/bin/env python3
import os
import subprocess
import sys


def get_nix_path_info(path, human_readable=False):
    cmd = ["nix", "path-info"]
    if human_readable:
        cmd.extend(["-S", "-h"])
    else:
        cmd.append("--size")
    cmd.append(path)
    result = subprocess.run(cmd, capture_output=True, text=True)
    return result.stdout.strip()


def main(image_path, packages):
    # Get container image size
    print("Analyzing size of container image...")
    print(get_nix_path_info(image_path, human_readable=True))
    print()

    # Get size of each package
    print("Breaking down container image size by package (sorted by size):")
    print("-------------------------------------------------------------")

    # Get sizes and names of packages
    package_info = []
    for pkg in packages:
        size_bytes = int(get_nix_path_info(pkg))
        name = os.path.basename(pkg)
        package_info.append((size_bytes, name, pkg))

    # Sort by size in descending order
    package_info.sort(reverse=True)

    # Print sorted results with human-readable sizes
    for size_bytes, name, pkg in package_info:
        human_size = get_nix_path_info(pkg, human_readable=True).split()[-1]
        print(f"{name}: {human_size}")

if __name__ == "__main__":
    import json
    
    # These placeholders will be replaced by the Nix build
    image_path = '__IMAGE_PATH__'
    packages_json = '__PACKAGES__'
    
    # Parse the JSON string back to a list
    packages = json.loads(packages_json)
    
    main(image_path, packages)
