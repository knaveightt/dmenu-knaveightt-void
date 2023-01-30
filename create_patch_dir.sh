#!/usr/bin/env bash
#
# create_patch_dir.sh
#
# Creates a director and downloads the specified patches used to patch
# a fresh ST terminal to my liking. 
#
# Make sure the directory variables in the beginning of this script are 
# updated correctly before executing.
#
# Make sure the list of patches to automatically download is up to date as well

PATCHING_DIR="${HOME}/Projects/dmenu-knaveightt-void-patching"
VOID_PKGS_DIR="${HOME}/Shelf/void-packages"

# list of patches to download for application
patch_list=(
    "https://tools.suckless.org/dmenu/patches/xresources/"
    "https://tools.suckless.org/dmenu/patches/highlight/"
    "https://tools.suckless.org/dmenu/patches/line-height/"
)



# create necessary folder structure and grab sources
echo "Creating destination folders..."
if [ -d "${PATCHING_DIR}" ] 
then
    echo "Perfoming clean up first..."
    rm -rf ${PATCHING_DIR}
    echo "Removed prior destination folder instance."
fi
mkdir ${PATCHING_DIR}
mkdir ${PATCHING_DIR}/patch_dl
echo "Destination folders created."

echo "\nEntering void-packages directory..."
cd ${VOID_PKGS_DIR}
echo "Cleaning any old package sources..."
./xbps-src clean
echo "Extracting latest dmenu source files..."
./xbps-src extract dmenu
echo "Copying sources to patching directory..."
cp -r masterdir/builddir/dmenu-* ${PATCHING_DIR}/
echo "Creating patched source directory..."
cp -r ${PATCHING_DIR}/dmenu-* ${PATCHING_DIR}/patched_dmenu
echo "Source directories created."


# Download requested patches to the patch_dl folder
echo "\nMoving to patch download directory..."
cd ${PATCHING_DIR}/patch_dl
echo "Downloading patches..."
for p in ${patch_list[@]}; do
    curl -O ${p}
done
echo "Patches downloaded."
echo "You may proceed to patch. Use README for patching hints."

