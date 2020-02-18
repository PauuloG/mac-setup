#!/usr/bin/env bash

#This is the tender script for setting up your laptop
set -xe

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
  pretty_print "Installing Homebrew"
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
  ansible
  coreutils
  docker
  findutils
  git
  gnupg
  graphicsmagick
  hh
  jp
  jq
  mackup
  socat
  tree
  vim
  webkit2png
  wget
  zsh
  zsh-completions
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
brew install cask

brew tap caskroom/fonts

#Install apps
apps=(
  1password
  1password-cli
  appcleaner
  bartender
  bitbar
  docker
  dropbox
  font-alegreya
  font-clear-sans
  font-fira-code
  font-inconsolata
  font-montserrat
  font-open-sans
  font-pt-sans
  font-quattrocento-sans
  font-raleway
  font-roboto
  font-source-sans-pro
  font-ubuntu
  iterm2
  keyboard-maestro
  postman
  qlcolorcode
  qlimagesize
  qlmarkdown
  qlprettypatch
  qlstephen
  qlvideo
  quicklook-csv
  quicklook-json
  rocket
  slack
  spectacle
  spotify
  the-unarchiver
  ukelele
  visual-studio-code
  vlc
  zoomus
)

for app in "${apps[@]}"
do
	printf "Installing %s\n" $app
	#echo "Type Y to install: \c"
	#read line
	#if [ "$line" = Y ] || [ "$line" = y ]; then
	brew cask install --appdir="/Applications" $app || 0
	#fi
done

#Install and config git
echo "Git Config"

git config --global user.name $GIT_USER_NAME
git config --global user.email $GIT_USER_EMAIL

#Generate github ssh keys
# echo "Generating SSH keys"
# ssh-keygen -t rsa -b 4096 -C  "$GIT_USER_EMAIL" -f ~/.ssh/id_rsa
# eval "$(ssh-agent -s)"
# ssh-add -K ~/.ssh/id_rsa

# echo <<HOSTS
# Host *
#  AddKeysToAgent yes
#  UseKeychain yes
#  IdentityFile ~/.ssh/id_rsa
# HOSTS > ~/.ssh/config

#Install oh-my-zsh
echo "Now badassify the terminal.."
echo "\n"
chsh -s /usr/local/bin/zsh
curl -L http://install.ohmyz.sh | sh
cd ~/.oh-my-zsh && git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
sudo chsh -s /usr/local/bin/zsh

#Now let's go for our ZSH config round
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
# echo DEFAULT_USER=$DEFAULT_USER >> ~/.zshrc
# echo "plugins=(git colored-man colorize github brew osx zsh-syntax-highlighting zsh-autosuggestions docker)" >> ~/.zshrc
# echo "source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
pretty_print "We are done!...everthing looks good!"

curl -L https://github.com/powerline/fonts/raw/master/DroidSansMono/Droid%20Sans%20Mono%20for%20Powerline.otf > /Library/Fonts/DroidSansMonoPowerline.otf
curl -L https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Solarized%20Dark%20-%20Patched.itermcolors > ~/Downloads/solarized-dark.itermcolors

source ~/.zshrc

# Installing powerlevel10k theme
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
# sed -i -e 's/.*ZSH_THEME.*/ZSH_THEME=powerlevel10k/powerlevel10k/'





