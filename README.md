# dmenu-knaveightt-void (dmenu-5.2)
> Patch used to modify [dmenu](https://tools.suckless.org/dmenu) used for my 
workstations. This patch is provided against dmenu-5.2 for use with xbps-src to 
automate patching and installation in void linux.

## Usage 
Included in this repo is a patch file which represents a collection of patches 
to the original dmenu source. The following are usage instructions for 
incorporating this patch using Void Linux's xbps-src build workflow, however 
the final patch can be used any way you would normally patch dmenu. 
- Copy the patch file to a *patches* directory in `void-packages/srcpkgs/dmenu` 
- Run `xbps-src pkg dmenu` to build the xbps package
- Install the package from the void-packages directory using 
`sudo xbps-install --force --repository=hostdir/binpkgs/ dmenu`
- Recommendation is to lock the st package to the local repo so changes from 
the default repositories don't overwrite the package. 
Do this using `xbps-pkgdb -m repolock dmenu`

## Patch List
List of included patches are as follows.
| Patch Name | Source URL |
| ---------- | ---------- |
| tsv alt | . |
| xresources | [https://tools.suckless.org/dmenu/patches/xresources/](https://tools.suckless.org/dmenu/patches/xresources/) |
| highlight | [https://tools.suckless.org/dmenu/patches/highlight/](https://tools.suckless.org/dmenu/patches/highlight/) |
| line height | [https://tools.suckless.org/dmenu/patches/line-height/](https://tools.suckless.org/dmenu/patches/line-height/) |

## Notes on Patch Application
- It seems to be a good idea to execute `./xbps-src clean` prior to doing any manual patching
- `xbps-src extract dmenu` was used to download the original source code for st for use of patching
- A copy of the source directory was created and used for the actual patching
- Patches were downloaded to a common directory (see *Patch List* section above)
- Patches were applied in this order using `patch -Np1 -i <input_patch_name>` in the patched source directory
    - tsv alt
    - xresources
    - highlight
    - line height
- A final *overall* patch was created using `diff -Np1 <original_source_dir> <patched_source_dir> > <diff_file_Name>`
- The final *overall* patch is what is included in this repo. Follow the *Usage* section for installation instructions
