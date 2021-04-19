# My dotfiles
<h2 align="center">
  `.dotfiles` created using <a href="https://github.com/CodelyTV/dotly">🌚 dotly</a>
</h2>

## Requirements
- [cargo](https://crates.io/), require `build-essential`.  
    * install `sudo apt-get install build-essenctial`
- [tldr, tealdeer](https://lib.rs/crates/tealdeer), require `libssl-dev`.  
    * install `sudo apt-get install libssl-dev`
- [navi](https://github.com/denisidoro/navi), require `fzf v0.24+`
    * upgrade **fzf** `cd ~/.fzf && git pull && ./install` according to [junegunn/fzf](https://github.com/junegunn/fzf)
    * check version location of fzf `which fzf` then remove `sudo apt-get remove fzf`
    * Check to new location is added in `.bashrc` and `.zshrc`
- [dotly pbcopy](./modules/dotly/bin/pbcopy) require `xclip`
    * `sudo apt-get install xclip`
    *(optional) `sudo apt-get install xsel`

## Restore your Dotfiles

* Install git
* Clone your dotfiles repository `git clone [your repository of dotfiles] $HOME/.dotfiles`
* Go to your dotfiles folder `cd $HOME/.dotfiles`
* Install git submodules `git submodule update --init --recursive`
* Install your dotfiles  `DOTFILES_PATH="$HOME/.dotfiles" DOTLY_PATH="$DOTFILES_PATH/modules/dotly" "$DOTLY_PATH/bin/dot" self install`
* Restart your terminal
* Import your packages `dot package import`
* Put `zsh` like a default terminal `chsh -s $(which zsh)`. Finally, log out and log back in.
* [Generate a new SSH key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) and adding it to the ssh-agent `ssh-keygen -t ed25519 -C "your_email@example.com"O`


## TODO
- [ ] PR, rust error in dot self install
- [ ] autoinstall [Requirements](#Requirements)
- [ ] PR, erro `No such file or directory` in `bash/completions/*` by `.gitkeep`
- [ ] Check `installation vim script`
- [ ] create dot to install `vscodium` and its configuration.

## References
- [How to make zsh the default shell](https://askubuntu.com/questions/131823/how-to-make-zsh-the-default-shell)
- [SSH Key: Ed25519 vs RSA](https://security.stackexchange.com/questions/90077/ssh-key-ed25519-vs-rsa)
