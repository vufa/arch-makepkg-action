#! /bin/sh -l

if [ -d "/github" ]; then
sudo chown -R build /github/workspace /github/home
fi

# add custom repositories to pacman.conf
for r in $INPUT_REPOS; do
    IFS=" " read -r -a splitarr <<< "${r//=/ }"
    echo -e "\n[${splitarr[0]}]" | sudo tee -a /etc/pacman.conf
    echo "Server = ${splitarr[1]}" | sudo tee -a  /etc/pacman.conf
done

# update repos
sudo pacman -Syy

if [ ! -z "$INPUT_BEFORE" ]; then
    eval $INPUT_BEFORE || exit $?
fi

sudo pacman -Syu --noconfirm

for pkg in $INPUT_PACKAGES; do
    yay -S "$pkg" --noconfirm --needed --useask --gpgflags "--keyserver hkp://pool.sks-keyservers.net" || exit $?
done

eval $INPUT_SCRIPTS || exit $?
