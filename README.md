# st-patched

A simple build of the [Suckless Terminal](https://st.suckless.org) (st) with many community patches applied together.
Targets st revision `9846a56` (a few commits after st version `0.9`).

This repo includes a single unified patch file with all patches built-in, that you can apply directly to the st source.
Individual patches used to create it are provided in the `patches/` directory.

## Patches included

- [alpha](https://st.suckless.org/patches/alpha/) _(osc 11)_
- [boxdraw](https://st.suckless.org/patches/boxdraw/) _(enabled by default, except braile)_
- [scrollback](https://st.suckless.org/patches/scrollback/) _(with reflow, mouse, altscreen & mouse increment subpatches, modified to work with boxdraw)_
- [ligatures](https://st.suckless.org/patches/ligatures/) _(boxdraw version)_
- [xresources](https://st.suckless.org/patches/xresources-with-reload-signal/) _(live reload with USR1)_
- [clipboard](https://st.suckless.org/patches/clipboard/)
- [desktopentry](https://st.suckless.org/patches/desktopentry/)
- [sync](https://st.suckless.org/patches/sync/) _(modified for st 0.9)_

## Using this patch

Clone the st source and apply the patch by running:
```
git clone git://git.suckless.org/st
git checkout 9846a56
git am path/to/st-patched-xxx-xxx.diff
```

## Modifying

Add or remove any patch files from the `patches/` directory.
Then, use the `patch.sh` script to download the st source and apply all patches in the `patches/` directory in order.
You now have a patched version of st in the `st/` directory.
This will also create a new unified patch with your changes included, which you can use separately if you wish.

# Credits

All patches included are credited to their respective authors.
Some have been modified to apply together cleanly.
See each patch page for more info.
Based on suckless.org's [Simple Terminal](https://st.suckless.org/).
