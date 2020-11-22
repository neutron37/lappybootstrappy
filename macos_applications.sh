# iterm2
brew cask install iterm2
  # Don’t display the annoying prompt when quitting iTerm
  defaults write com.googlecode.iterm2 PromptOnQuit -bool false
  # Install iterm2 zsh shell integration
  curl -q -L https://iterm2.com/shell_integration/zsh \
    -o ~/.iterm2_shell_integration.zsh

# zsh
brew install zsh
  # Install OhMyZsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  # Install OhMyZsh plugins
  brew install zsh-autosuggestions
  brew install zsh-navigation-tools
  brew install zsh-syntax-highlighting
  brew install zsh-completions

  brew install tree
  # Fix permissions
  compaudit |  xargs chmod g-w,o-w
  # https://unix.stackexchange.com/questions/210930/completions-stopped-working-after-upgrading-zsh/210931#210931
  rm ~/.zcompdump*

# VSCode
# brew cask install visual-studio-code
# open /Applications/Visual\ Studio\ Code.app
brew cask install vscodium
open /Applications/VSCodium.app

# ShiftIt
brew cask install shiftit
xattr -r -d com.apple.quarantine /Applications/ShiftIt.app
open /Applications/ShiftIt.app

# 1Password
brew cask install 1password
open ~/Documents/licenses/my.onepassword7-license-mac

# Docker
brew cask install docker
open /Applications/Docker.app

# Chrome
brew cask install google-chrome
open /Applications/Google\ Chrome.app

# Slack
brew cask install Slack

# GPG Suite
brew cask install gpg-suite

# Vagrant
brew cask install vagrant

# VirtualBox
brew cask install virtualbox

# MAS - Mac App Store command line interface
brew install mas
# Install Things 3
mas install 904280696
# Install Marked 2
mas install 890031187

# Install keybase
brew cask install keybase
open /Applications/Keybase.app

# Sync Desktop
cd /tmp
git clone keybase://private/neutron37/Desktop
mv Desktop/.git ~/Desktop
rsync -av Desktop/ ~/Desktop
rm -rf /tmp/Desktop

# Sync Documents
git clone keybase://private/neutron37/Documents
mv Documents/.git ~/Documents
rsync -av Documents/ ~/Documents
rm -rf /tmp/Documents

# Sync home
git clone keybase://private/neutron37/home
mv home/.git $HOME/
rsync home/ $HOME
rm -rf /tmp/home

# Alfred
brew cask install alfred
atom ~/Documents/licenses/alfred.license
open /Applications/Alfred\ 4.app
open https://github.com/stuartcryan/custom-iterm-applescripts-for-alfred/blob/master/custom_iterm_script_iterm_3.1.1.applescript

# Install useful commands
brew install wget ripgrep loc watch most nmap netcat telnet scc

# Install PHP stuff
brew install php@7.1 composer

# Install PHP Storm
brew cask install phpstorm

# Install etcher
brew cask install balenaetcher

# Install signal
brew cask install signal

# Install taskwarrior
brew install task
brew install taskd
brew install tasksh

# Install localtunnel
npm install -g localtunnel

# Install spotify
brew cask install spotify

# Install Thunderbird
brew cask install thunderbird

# Install kind and minikube
brew install kind
brew install minikube

# Install yubico tools
brew cask install homebrew/cask-drivers/yubico-authenticator
brew cask install homebrew/cask-drivers/yubico-yubikey-manager
brew install ykman

# Update slot two for slower typing
# ykman otp settings -p20 2

# Install karabiner
brew cask install karabiner-elementss

# Install postman
brew cask install postman

# Install firefox
brew cask install firefox

# Install Tutanota
brew cask install tutanota

# Install min.io client
brew install minio/stable/mc

# Install Ableton 9 Suite
brew tap homebrew/cask-versions
brew cask install ableton-live-suite9

# Install tmate (terminal multiplexer)
brew install tmate

# Install Little Snitch
brew cask install little-snitch
open '/usr/local/Caskroom/little-snitch/4.4.2/LittleSnitch-4.4.2.dmg'
sleep 10
open '/Volumes/Little Snitch 4.4.2/Little Snitch Installer.app'
code ~/Documents/licenses/little-snitch.license

# Install Micro snitch
brew cask install micro-snitch
open '/Applications/Micro Snitch.app'
code ~/Documents/licenses/micro-snitch-dual.license

# Install testssl.sh
brew install testssl

# Install npm
brew install npm

# Install git-secret
brew install git-secret

# Install Kindle
brew cask install kindle

# Install JAVA (OpenJDK)
brew cask install java

# Install font inconsolata
brew tap homebrew/cask-fonts
brew cask install font-inconsolata
brew cask install font-inconsolata-for-powerline

# Zettlr notebook
brew cask install Zettlr

# # Install Symfony
# curl -sS https://get.symfony.com/cli/installer | bash
# mv /Users/user1/.symfony/bin/symfony /usr/local/bin/symfony

# Install hyperkit
brew install hyperkit
