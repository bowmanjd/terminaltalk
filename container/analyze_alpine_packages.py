#!/usr/bin/env python3
"""
Analyze Alpine package sizes in a Docker container.
This script builds the container from the Dockerfile, runs it,
and lists all explicitly installed packages by size in descending order.
"""

import subprocess
import os
import sys
from operator import itemgetter

def build_container():
    """Build the container from the Dockerfile in the current directory."""
    print("Building container...")
    result = subprocess.run(
        ["docker", "build", "-t", "alpine-analysis", "."],
        capture_output=True,
        text=True
    )
    if result.returncode != 0:
        print(f"Error building container: {result.stderr}")
        sys.exit(1)
    return "alpine-analysis"

def get_installed_packages(container_name):
    """Get list of explicitly installed packages in the container."""
    print("Getting explicitly installed packages...")
    try:
        result = subprocess.run(
            [
                "docker", "run", "--rm", container_name,
                "sh", "-c", "apk info -a | grep -A1 'installed size:' | paste - - | sort -k5,5nr"
            ],
            capture_output=True,
            text=True,
            check=True
        )
    except subprocess.CalledProcessError as e:
        print(f"Error getting package info: {e.stderr}")
        sys.exit(1)
        
    packages = []
    for line in result.stdout.strip().split('\n'):
        if not line.strip():
            continue
        
        try:
            parts = line.split()
            if len(parts) >= 6 and parts[3] == "size:":
                package_name = parts[0]
                try:
                    size_value = float(parts[4])
                    size_unit = parts[5]
                except (ValueError, IndexError):
                    print(f"Warning: Could not parse size for package {package_name}, skipping")
                    continue
            
            # Convert to KB for consistent comparison
            if size_unit == "MiB":
                size_kb = size_value * 1024
            elif size_unit == "KiB":
                size_kb = size_value
            else:
                size_kb = size_value / 1024  # Assuming bytes
                
            packages.append({
                "name": package_name,
                "size": size_kb,
                "size_human": f"{size_value} {size_unit}"
            })
    
    return sorted(packages, key=itemgetter("size"), reverse=True)

def main():
    container_name = build_container()
    packages = get_installed_packages(container_name)
    
    # Print results in a table format
    print("\nPackage Sizes (sorted by size, descending):")
    print("-" * 50)
    print(f"{'Package':<30} {'Size':<15}")
    print("-" * 50)
    
    total_size = 0
    for pkg in packages:
        print(f"{pkg['name']:<30} {pkg['size_human']:<15}")
        total_size += pkg['size']
    
    print("-" * 50)
    print(f"Total size: {total_size/1024:.2f} MiB")
    
    # Identify potential packages to remove
    print("\nLargest packages (potential candidates for removal):")
    for pkg in packages[:5]:  # Top 5 largest packages
        print(f"- {pkg['name']} ({pkg['size_human']})")

if __name__ == "__main__":
    main()
