FROM archlinux/archlinux:base-devel
MAINTAINER Codist <countstarlight@gmail.com>

ENV UGID='2000' UGNAME='build'

# Add sudoers
RUN echo "build ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$UGNAME

RUN chmod 'u=r,g=r,o=' /etc/sudoers.d/$UGNAME

RUN \
    # Update
    pacman-key --init && \
    pacman-key --populate archlinux && \
    pacman -Syu \
        base-devel \
        git \
        reflector \
        rsync \
        --noconfirm --need && \
    # Clean .pacnew files
    find / -name "*.pacnew" -exec rename .pacnew '' '{}' \;

# Setup build user/group
RUN \
    groupadd --gid "$UGID" "$UGNAME" && \
    useradd --create-home --uid "$UGID" --gid "$UGID" --shell /usr/bin/false "${UGNAME}"

USER $UGNAME

RUN \
    sudo reflector --verbose -l 10 \
        --sort rate --save /etc/pacman.d/mirrorlist

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/bin/core_perl

# install yay
RUN \
    cd /home/$UGNAME && \
    curl -O -s https://aur.archlinux.org/cgit/aur.git/snapshot/yay-bin.tar.gz && \
    tar xf yay-bin.tar.gz && \
    cd yay-bin && makepkg -is --skippgpcheck --noconfirm && cd .. && \
    rm -rf yay-bin && rm yay-bin.tar.gz

# Enable multilib repo
RUN sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
