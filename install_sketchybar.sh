echo "Installing Dependencies"
brew install --cask sf-symbols
brew install jq
brew install gh
brew install switchaudio-osx
brew tap FelixKratz/formulae
brew install sketchybar
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.23/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

echo "Cloning Config"
git clone https://github.com/FelixKratz/dotfiles.git /tmp/dotfiles
mv $HOME/.config/sketchybar $HOME/.config/sketchybar_backup
mv /tmp/dotfiles/.config/sketchybar $HOME/.config/sketchybar
rm -rf /tmp/dotfiles
brew services restart sketchybar

brew tap FelixKratz/formulae
brew install borders
borders active_color=0xffe1e3e4 inactive_color=0xff494d64 width=5.0 &
brew services start borders

# yabai
brew install koekeishiya/formulae/yabai
brew services start yabai
killall Dock
# skhd
brew install koekeishiya/formulae/skhd
brew services start skhd
