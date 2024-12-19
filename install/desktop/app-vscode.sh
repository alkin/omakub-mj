yay -S --needed visual-studio-code-bin --noconfirm

mkdir -p ~/.config/Code/User
cp ~/.local/share/omakub/configs/vscode.json ~/.config/Code/User/settings.json

# Install default supported themes
code --install-extension enkia.tokyo-night

# Increase inotify limit
echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.d/60-max-user-watches.conf && sudo sysctl --system