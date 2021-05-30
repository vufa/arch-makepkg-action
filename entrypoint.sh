#! /bin/sh -l

if [ -d "/github" ]; then
sudo chown -R build /github/workspace /github/home
fi

sudo pacman -Syu --noconfirm
#namcap PKGBUILD

echo $INPUT_PACKAGES
#sudo makepkg -fC --syncdeps --noconfirm

echo "==============="
echo "Package created:"
echo `ls *.pkg.tar.xz`
echo "==============="
