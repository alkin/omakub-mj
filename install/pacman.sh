# Init pacman
sudo sed -i -e 's/#Color/Color/g' /etc/pacman.conf
sudo sed -i -e 's/#ParallelDownloads = 5/ParallelDownloads = 10/g' /etc/pacman.conf
sudo sed -i -e 's/pkg.tar.xz/pkg.tar/g' /etc/makepkg.conf
sudo sed -i -e 's/pkg.tar.xz/pkg.tar/g' /etc/makepkg.conf

sudo pacman-mirrors --country Brazil