#!/bin/bash

# Get the latest version of v0.*.* tag
version_to_use=$(git tag -l 'v0.*.*' | sort -V | tail -n 1)
echo "Current version: $version_to_use"

# Remove the leading 'v' and split the version string into components
version_without_v=${version_to_use#v}

# Generate new version
major_version=$(echo "$version_without_v" | cut -d '.' -f 1)
minor_version=$(echo "$version_without_v" | cut -d '.' -f 2)
patch_version=$(echo "$version_without_v" | cut -d '.' -f 3)
new_patch_version=$((patch_version + 1))
new_version="v${major_version}.${minor_version}.${new_patch_version}"
echo "New version: $new_version"

new_v2_version="v2.${minor_version}.${new_patch_version}"
echo "New V2 version: $new_v2_version"

# Create a new tag and push
git tag $new_version; git push --tags
git tag $new_v2_version; git push --tags