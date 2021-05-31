#! /bin/sh -l

if [ -d "/github" ]; then
sudo chown -R build /github/workspace /github/home
fi

sudo pacman -Syu --noconfirm

for pkg in $INPUT_PACKAGES; do
    yay -S "$pkg" --noconfirm --needed --useask --gpgflags "--keyserver hkp://pool.sks-keyservers.net" || exit $?
done

eval $INPUT_SCRIPTS || exit $?
