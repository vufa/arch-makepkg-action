# arch-makepkg-action

<p align="center">
  <a href="https://github.com/countstarlight/arch-makepkg-action/actions">
    <img src="https://img.shields.io/github/workflow/status/countstarlight/arch-makepkg-action/Build%20docker/master?logo=github&style=flat-square" alt="Build Status">
  </a>
  <a href="https://hub.docker.com/r/countstarlight/makepkg">
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

## Real-world applications

* [deepin-wine-tim-arch](https://github.com/countstarlight/deepin-wine-tim-arch/actions)  |  [ci.yml](https://github.com/countstarlight/deepin-wine-tim-arch/blob/action/.github/workflows/ci.yml) |  ![Build Status](https://img.shields.io/github/workflow/status/countstarlight/deepin-wine-tim-arch/CI/action?logo=github&style=flat-square)

* [deepin-wine-wechat-arch](https://github.com/countstarlight/deepin-wine-wechat-arch/actions)  |  [ci.yml](https://github.com/countstarlight/deepin-wine-wechat-arch/blob/action/.github/workflows/ci.yml) | ![Build Status](https://img.shields.io/github/workflow/status/countstarlight/deepin-wine-wechat-arch/CI/action?logo=github&style=flat-square)

* [deepin-wine-qq-arch](https://github.com/countstarlight/deepin-wine-qq-arch/actions) |  [ci.yml](https://github.com/countstarlight/deepin-wine-qq-arch/blob/action/.github/workflows/ci.yml)  |  ![Build Status](https://img.shields.io/github/workflow/status/countstarlight/deepin-wine-qq-arch/CI/action?logo=github&style=flat-square)

## License
The scripts and documentation in this project are released under the [MIT License](LICENSE)
