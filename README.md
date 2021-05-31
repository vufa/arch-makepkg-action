# arch-makepkg-action

<p align="center">
  <a href="https://github.com/countstarlight/arch-makepkg-action/actions">
    <img src="https://img.shields.io/github/workflow/status/countstarlight/arch-makepkg-action/Build%20docker/master?logo=github&style=flat-square" alt="Build Status">
  </a>
  <a href="https://hub.docker.com/repository/docker/countstarlight/makepkg">
    <img src="https://img.shields.io/docker/pulls/countstarlight/makepkg?logo=docker&style=flat-square" alt="Docker pulls">
  </a>
  <a href="https://github.com/countstarlight/arch-makepkg-action/blob/master/LICENSE">
    <img src="https://img.shields.io/github/license/countstarlight/arch-makepkg-action?style=flat-square" alt="License">
  </a>
</p>

This create a package using the PKGBUILD on the root of the repository

## Usage

```yaml
steps:
- name: Build archlinux package
  uses: countstarlight/arch-makepkg-action@master
  with:
    packages: >
      p7zip
      wine
    scripts: "makepkg"
```

Then you can upload the artifact with your package name and version specified
on the PKGBUILD

## License
The scripts and documentation in this project are released under the [MIT License](LICENSE)
