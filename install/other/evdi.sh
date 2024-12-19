yay -S $(pacman -Qqe | grep linux | head -1)-headers evdi displaylink --needed --noconfirm

sudo systemctl enable displaylink
sudo systemctl start displaylink