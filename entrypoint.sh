#! /bin/sh -l

if [ -d "/github" ]; then
sudo chown -R build /github/workspace /github/home
fi

# add custom repositories to pacman.conf
for r in $INPUT_REPOS; do
    IFS=" " read -r -a splitarr <<< "${r//=/ }"
    sudo echo -e "\n[${splitarr[0]}]" >> /etc/pacman.conf
    sudo echo "Server = ${splitarr[1]}" >> /etc/pacman.conf
done

# update repos
sudo pacman -Syy

sudo pacman -Syu --noconfirm

for pkg in $INPUT_PACKAGES; do
    yay -S "$pkg" --noconfirm --needed --useask --gpgflags "--keyserver hkp://pool.sks-keyservers.net" || exit $?
done

eval $INPUT_SCRIPTS || exit $?
