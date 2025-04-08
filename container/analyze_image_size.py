#!/usr/bin/env python3
import json
import os
import subprocess
import sys

from humanfriendly import format_size
import struct

def get_nix_path_info(path):
    cmd = ["nix", "path-info", "-S", "--json"]
    cmd.append(path)
    result = subprocess.run(cmd, capture_output=True, text=True)
    return json.loads(result.stdout.strip())


def get_nix_closure_size(path):
    info = get_nix_path_info(path)
    size = info[path]["closureSize"]
    return {"path": path, "size": size, "readable": format_size(size)}


def get_package_sizes(image_path, packages):
    print(f"Container image: {image_path}")
    print(f"Container image size: {get_nix_closure_size(image_path)['readable']}")

    pkg_list = sorted(
        [get_nix_closure_size(pkg) for pkg in packages],
        key=lambda x: x["size"],
        reverse=True,
    )

    for pkg in pkg_list:
        print(f"{pkg['path']}: {pkg['readable']}")


if __name__ == "__main__":
    # In the actual execution, these will be passed from the flake
    if len(sys.argv) < 3:
        print("Usage: analyze_image_size.py <image_path> <package1> [package2] ...")
        sys.exit(1)

    image_path = sys.argv[1]
    packages = sys.argv[2:]
    get_package_sizes(image_path, packages)
