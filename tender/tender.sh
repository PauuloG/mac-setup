#!/usr/bin/env bash

#This is the kaishi script for setting up your laptop
set -e

echo "Upgrade Xcode"
xcode-select --install

sudo -v

#Shared functions

pretty_print() {
  printf "\n%b\n" "$1"
}

pretty_print "Here we go..."

#So it begins
#Homebrew installation

if ! command -v brew &>/dev/null; then
  pretty_print "Installing Homebrew, an OSX package manager, follow the instructions..." 
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  if ! grep -qs "recommended by brew doctor" ~/.zshrc; then
    pretty_print "Put Homebrew location earlier in PATH ..."
      printf '\n# recommended by brew doctor\n' >> ~/.zshrc
      printf 'export PATH="/usr/local/bin:$PATH"\n' >> ~/.zshrc
      export PATH="/usr/local/bin:$PATH"
  fi
else
  pretty_print "You already have Homebrew installed...good job!"
fi

pretty_print "Updating brew formulas"
  	brew update

#Homebrew OSX libraries

dev=(
    coreutils
    docker
    findutils
    git
    graphicsmagick
    heroku-toolbelt
    imagemagick
    jq
    mackup
    tree
    vim
    webkit2png
    wget
    zsh
    zsh-syntax-highlighting
)

echo "installing development binaries..."
brew install ${dev[@]}

#OpenSSL linking
pretty_print "Installing and linking OpenSSL..."
brew install openssl
brew link openssl --force

#Install brew cask
pretty_print "Installing cask to install apps"
	brew install caskroom/cask/brew-cask

pretty_print "Installing launchrocket to manage your homebrew formulas like a champ!"
	brew cask install launchrocket
	
#Install apps
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

for app in "${apps[@]}"
do
	printf "Installing %s\n" $app
	echo "Type Y to install: \c"
	read line
	if [ "$line" = Y ] || [ "$line" = y ]; then
		brew cask install --appdir="/Applications" $app
	fi
done

brew tap caskroom/fonts
brew cask install font-hack

#Installing fonts
pretty_print "Installing some caskroom/fonts..."
brew tap caskroom/fonts

fonts=(
  font-m-plus
  font-clear-sans
  font-roboto
  font-open-sans
  font-source-sans-pro
  font-lobster
  font-alegreya
  font-montserrat
  font-inconsolata
  font-pt-sans
  font-quattrocento-sans
  font-quicksand
  font-raleway
  font-sorts-mill-goudy
  font-ubuntu
)

#Install fonts
pretty_print "Installing the fonts..."
brew cask install ${fonts[@]}

#Install and config git
echo "Git Config"
echo "\n"
which git

git config --global user.name $GIT_USER_NAME
git config --global user.email $GIT_USER_EMAIL

#Generate github ssh keys
echo "Generating SSH keys"
echo "\n"
ssh-keygen -t rsa -b 4096 -C  "$GIT_USER_EMAIL" -f ~/.ssh/id_rsa
eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa

echo <<HOSTS 
Host *
 AddKeysToAgent yes
 UseKeychain yes
 IdentityFile ~/.ssh/id_rsa
HOSTS > ~/.ssh/config

#Install oh-my-zsh
echo "Now badassify the terminal.."
echo "\n"
chsh -s /usr/local/bin/zsh
curl -L http://install.ohmyz.sh | sh
cd ~/.oh-my-zsh && git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#Now let's go for our ZSH config round
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
echo DEFAULT_USER=$DEFAULT_USER >> ~/.zshrc
echo plugins=(git colored-man colorize github brew osx zsh-syntax-highlighting zsh-autosuggestions docker) >> ~/.zshrc
pretty_print "We are done!...everthing looks good!"
