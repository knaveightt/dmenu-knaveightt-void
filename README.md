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
| linesbelowprompt | [https://tools.suckless.org/dmenu/patches/lines-below-prompt/dmenu-linesbelowprompt-and-fullwidth-20211014.diff](https://tools.suckless.org/dmenu/patches/lines-below-prompt/dmenu-linesbelowprompt-and-fullwidth-20211014.diff) |
| border | [https://tools.suckless.org/dmenu/patches/border/dmenu-border-5.2.diff](https://tools.suckless.org/dmenu/patches/border/dmenu-border-5.2.diff) | 
| xyw | [https://tools.suckless.org/dmenu/patches/xyw/dmenu-xyw-5.0.diff](https://tools.suckless.org/dmenu/patches/xyw/dmenu-xyw-5.0.diff) |
| center | [https://tools.suckless.org/dmenu/patches/center/dmenu-center-5.2.diff](https://tools.suckless.org/dmenu/patches/center/dmenu-center-5.2.diff) |
| tsv alt | [https://tools.suckless.org/dmenu/patches/tsv-alt/dmenu-tsv-alt-20220919-fce06f4.diff](https://tools.suckless.org/dmenu/patches/tsv-alt/dmenu-tsv-alt-20220919-fce06f4.diff) |
| xresources | [https://tools.suckless.org/dmenu/patches/xresources/dmenu-xresources-4.9.diff](https://tools.suckless.org/dmenu/patches/xresources/dmenu-xresources-4.9.diff) |
| highlight | [https://tools.suckless.org/dmenu/patches/highlight/dmenu-highlight-20201211-fcdc159.diff](https://tools.suckless.org/dmenu/patches/highlight/dmenu-highlight-20201211-fcdc159.diff) |
| line height | [https://tools.suckless.org/dmenu/patches/line-height/dmenu-lineheight-5.2.diff](https://tools.suckless.org/dmenu/patches/line-height/dmenu-lineheight-5.2.diff) |

## Notes on Patch Application
- It seems to be a good idea to execute `./xbps-src clean` prior to doing any manual patching
- `xbps-src extract dmenu` was used to download the original source code for st for use of patching
- A copy of the source directory was created and used for the actual patching
- Patches were downloaded to a common directory (see *Patch List* section above)
- Patches were applied in this order using `patch -Np1 -i <input_patch_name>` in the patched source directory
    - tsv alt
      - Needed to fix the usage function, minor tweak
    - xresources
    - highlight
    - line height
      - Needed to fix the usage function, minor tweak
    - xyw
      - Needed to fix the usage function, minor tweak
      - Needed to fix adding argument detection, minor tweak
    - center
      - Needed to fix if statements to incorporeate center patch with xyw
    - border
      - Needed to add constant var, minor tweak
    - linesbelowprompt
- A final *overall* patch was created using `diff -Np1 <original_source_dir> <patched_source_dir> > <diff_file_Name>`
- The final *overall* patch is what is included in this repo. Follow the *Usage* section for installation instructions
