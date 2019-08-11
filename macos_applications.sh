# iterm2
brew cask install iterm2
  # Don’t display the annoying prompt when quitting iTerm
  defaults write com.googlecode.iterm2 PromptOnQuit -bool false
  # Install iterm2 zsh shell integration
  curl -q -L https://iterm2.com/shell_integration/zsh \
    -o ~/.iterm2_shell_integration.zsh
  # Install imgcat
  curl -s -L https://www.iterm2.com/utilities/imgcat \
    -o ~/.local/bin/imgcat
  chmod +x ~/.local/bin/imgcat
  # Install imgls
  curl -s -L https://www.iterm2.com/utilities/imgls \
    -o ~/.local/bin/imgls
  chmod +x ~/.local/bin/imgls
  # Install divider
  curl -s -L https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/divider \
    -o ~/.local/bin/divider
  chmod +x ~/.local/bin/divider

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


# atom
brew cask install atom
open /Applications/Atom.app

# VSCode
# brew cask install visual-studio-code
# open /Applications/Visual\ Studio\ Code.app

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
brew install wget ripgrep loc watch most

# Install PHP stuff
brew install php@7.1 composer

# Install etcher
brew cask install balenaetcher

# Install signal
brew cask install signal

# Install localtunnel
npm install -g localtunnel

# Install spotify
brew cask install spotify

# Install Thunderbird
brew cask install thunderbird

# Install Tutanota
brew cask install tutanota

# Install Vitamin-R
brew cask install vitamin-r
open '/Applications/Vitamin-R 3.app'
atom ~/Documents/licenses/vitamin-r.license.yaml

# Install Ableton 9 Suite
brew tap homebrew/cask-versions
brew cask install ableton-live-suite9

# Install Little Snitch
brew cask install little-snitch
open '/usr/local/Caskroom/little-snitch/4.4.2/LittleSnitch-4.4.2.dmg'
sleep 10
open '/Volumes/Little Snitch 4.4.2/Little Snitch Installer.app'
atom ~/Documents/licenses/little-snitch.license

# Install Micro snitch
brew cask install micro-snitch
open '/Applications/Micro Snitch.app'
atom ~/Documents/licenses/micro-snitch-dual.license
