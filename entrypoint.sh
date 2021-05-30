#! /bin/sh -l

if [ -d "/github" ]; then
sudo chown -R build /github/workspace /github/home
fi

sudo pacman -Syu --noconfirm
#namcap PKGBUILD

if [ ${#INPUT_PACKAGES[@]} -gt 0 ]; then
    for pkg in "${INPUT_PACKAGES[@]}"; do
      yay -S "$pkg" --noconfirm --needed --useask --gpgflags "--keyserver hkp://pool.sks-keyservers.net" || exit $?
    done
fi

#sudo makepkg -fC --syncdeps --noconfirm
makepkg

echo "==============="
echo "Package created:"
echo `ls *.pkg.tar.xz`
echo "==============="
