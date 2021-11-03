Personal config files for *nix envs
===================================

### Dotfiles installation

-   Just run the installer script

    `# ./scripts/install_dotfiles.sh`

### Install vim plugins

-   Run the provisioner script

    `# ./scripts/provision_vim.sh`

### Notes for MacOS X:
1. Most probably there will be issues with special characters for vim-airline. You should be fine with powerline fonts, get those like this:

        # git clone https://github.com/powerline/fonts.git 
        # cd fonts
        # ./install.sh

Then go to the Terminal.app preferences, then _profiles_ -> _profile_name_ -> _Font (Change font)_ -> look for ones that say smth like "font for powerline" -> enjoy :)
 
