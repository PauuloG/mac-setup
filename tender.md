# Tender

## What is Tender ?

Tender is an automated script that will enable you to setup your mac automatically.

It uses a minimal config file, located in this repo at `tender/.env.dist` that you can copy to `tender/.env`

You can put your own values in this file and source it \(`. tender/.env`\). This will enable tender to access your variables.

Let's go through the different steps Tender follows

### xCode shit

You need to install xCode command-line tools. So we will initiate the install for you.

You will be prompted for your password to gain sudo rights during the whole install script.

### Homebrew

Install Homebrew and a set of formulaes defined in the script :

```
dev=(
    coreutils
    docker
    findutils
    git
    graphicsmagick
    jq
    mackup
    tree
    vim
    wget
    zsh
    zsh-syntax-highlighting
)
```

Nothing really fancy, just the basic toolbelt.

### Cask

Cask is installed with Homebrew and installs the following apps :

```
apps=(
    appcleaner
    betterzipql
    dashlane
    dropbox
    flux
    franz
    google-chrome
    google-drive
    iterm2
    qlcolorcode
    qlmarkdown
    qlprettypatch
    qlstephen
    quicklook-csv
    quicklook-json
    rocket
    sequel-pro
    spectacle
    spotify
    suspicious-package
    the-unarchiver
    transmission
    transmit
    vlc
    vscode
)
```

\(Each app will be prompted and the user will have to confirm. Might change this if it gets annoying\).

We also use cask to install a couple of fonts.

### Git

We setup a couple of Git global variables read from your .env file.

### Oh My Zsh install

Well, it installs Oh My Zsh.

Then also the [Zsh syntax highlighting plugin](/github.com/zsh-users/zsh-syntax-highlighting.git), and the [PowerLevel9k theme.](https://github.com/bhilburn/powerlevel9k.git) We then use the `DEFAULT_USER` variable to prevent the term from displaying the username of the current user.

