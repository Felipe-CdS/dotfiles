# Dotfiles

My Linux dotfiles.

The idea of the repository isn't to just list my config files, but save everything
that I use daily, like packages or scripts, so when I reinstall my distro or
something breaks I can remember exactly where everything was. Some scripts that
usually live at .local/bin or .local/share are also here for this reason.

# Current setup and locations
- Window Manager:       DWM (~/.local/share/dwm)
- Code editor:          Neovim (~/.config/nvim)
- Terminal:             Alacritty (~/.config/alacritty)
- Terminal Multiplexer: Tmux (~/.config/tmux)
- Window Composer:      Picom (~/.config/picom)

# Some notes to remember about the configs

Some files dont do anything in the current setup. They're here just in case I
need some backup. Also, I usually symlink these files everywhere, so maybe
something is still using them and I don't remember.
- .Xresources;
- .vimrc;
- .bashrc;
- Anything i3 related;
- Polybar;

With this setup keep termguicolors = false in the neovim configs. When it's set
to true, a default color scheme load and the terminal colors dont work. Also,
the tmux color configs and the alacritty env are important to keep true colors.
Dont touch it.

Big and complicated packages that have their own directory hierarchy and didn't
come from pacman (e.g Visual Paradigm) usually are at /opt/ with a symlink at
/usr/bin.

The dwm library is small, but I chose not to save it here. I changed some parts
of the source code, applying third-party patches and writing things by myself too.
So to rebuild my dwm setup, download the 6.5 version and apply the diff file
located local/share/dwm.

The dwm.c source file was changed by me after applying the gaps.diff patch because
I wanted gaps when just one window is on screen. Check the resizeclient() method
at dwm.c for more info about this change. 
