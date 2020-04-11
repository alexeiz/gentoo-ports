# Gentoo ebuilds for Funtoo

## Add repo to Funtoo

1. Clone repository somewhere:

```
$ git clone https://github.com/alexeiz/gentoo-ports.git /local/overlays/gentoo-ports
```

2. Create file `/etc/portage/repos.conf/gentoo-ports.conf` containing:

```
[gentoo-ports]
location = /local/overlays/gentoo-ports
auto-sync = no
priority = 10
```
