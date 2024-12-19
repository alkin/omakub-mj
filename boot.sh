set -e

ascii_art='   ____  __  ______    __ ____  ______     __  ___    __
  / __ \/  |/  /   |  / //_/ / / / __ )   /  |/  /   / /
 / / / / /|_/ / /| | / ,< / / / / __  |  / /|_/ /_  / / 
/ /_/ / /  / / ___ |/ /| / /_/ / /_/ /  / /  / / /_/ /  
\____/_/  /_/_/  |_/_/ |_\____/_____/  /_/  /_/\____/   
'

echo -e "$ascii_art"
echo "=> Omakub is for fresh Manjaro GNOME 24 or newer installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

# Init pacman
sudo sed -i -e 's/#Color/Color/g' /etc/pacman.conf
sudo sed -i -e 's/#ParallelDownloads = 5/ParallelDownloads = 10/g' /etc/pacman.conf
sudo sed -i -e 's/pkg.tar.xz/pkg.tar/g' /etc/makepkg.conf
sudo sed -i -e 's/pkg.tar.xz/pkg.tar/g' /etc/makepkg.conf

sudo pacman-mirrors --country Brazil

sudo pacman -Syyuu --noconfirm

#
command -v yay >/dev/null 2>&1 || sudo pacman -S --noconfirm yay git
yay -Syyuu --noconfirm

echo "Cloning Omakub..."
rm -rf ~/.local/share/omakub
git clone https://github.com/alkin/omakub-mj.git ~/.local/share/omakub >/dev/null
if [[ $OMAKUB_REF != "master" ]]; then
  cd ~/.local/share/omakub
  git fetch origin "${OMAKUB_REF:-stable}" && git checkout "${OMAKUB_REF:-stable}"
  cd -
fi

echo "Installation starting..."
source ~/.local/share/omakub/install.sh
