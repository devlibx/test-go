#!/bin/bash

# Get the latest version of v0.*.* tag
version=$(git tag -l 'v0.*.*' | sort -V | tail -n 1)
echo "Current version: $version"

# Remove the leading 'v' and split the version string into components
version_without_v=${version#v}
IFS='.' read -ra VERSION_PARTS <<< "$version_without_v"

# Generate new version
major_version=${VERSION_PARTS[0]}
minor_version=${VERSION_PARTS[1]}
patch_version=${VERSION_PARTS[2]}
new_patch_version=$((patch_version + 1))
new_version="v${major_version}.${minor_version}.${new_patch_version}"
echo "New version: $new_version"

new_v2_version="v2.${minor_version}.${new_patch_version}"
echo "New V2 version: $new_v2_version"

# Create a new tag and push
git tag $new_version; git push --tags
git tag $new_v2_version; git push --tags