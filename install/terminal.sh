# Needed for all installers
sudo pacman -Syyuu --noconfirm
sudo pacman -S curl git unzip base-devel fakeroot --noconfirm

# sudo pacman -R onlyoffice-desktopeditors

# Run terminal installers
for installer in ~/.local/share/omakub/install/terminal/*.sh; do source $installer; done

echo "Finished installing all Terminal-based apps and configurations. Log out and log back in."
