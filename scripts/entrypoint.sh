#! /bin/sh -l

if [ -d "/github" ]; then
sudo chown -R build /github/workspace /github/home
fi

pacman -Sy
namcap PKGBUILD
makepkg -fC --syncdeps --noconfirm

echo "==============="
echo "Package created:"
echo `ls *.pkg.tar.xz`
echo "==============="
