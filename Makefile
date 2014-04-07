PREFIX       = /usr
SYSCONF      = /etc
BIN          = /bin
DATA         = /share
LICENSES     = $(DATA)/licenses
PKGNAME      = system-configurations
DEFAULT_SH   = bash

SRC_ETC      = fstab          host.conf   hosts         issue    ld.so.conf  login.defs  \
               nsswitch.conf  os-release  pony-release  profile  securetty   shells
TOUCH_ETC    = resolv.conf    crypttab


_ROOT        = grep -o / | sed -e ':a;N;$!ba;s:\n::g' | sed -e 's:/:../:g' | sed -e 's:/$$::g'
SYSCONF_ROOT = $(shell echo "$(SYSCONF)" | $(_ROOT))
SYSCONF_BIN  = $(shell echo "$(SYSCONF)" | $(_ROOT))


.PHONY: all clean
all:
clean:


.PHONY: install
install: install-license install-files


.PHONY: install-files
install-files:
	install -dm755 --                                     "$(DESTDIR)$(SYSCONF)"
	install  -m644 -- $(foreach S, $(SRC_ETC), etc/$(S))  "$(DESTDIR)$(SYSCONF)"
	touch          -- $(foreach S, $(TOUCH_ETC),          "$(DESTDIR)$(SYSCONF)"/$(S))


.PHONY: install-license
install-license:
	install -dm755 --         "$(DESTDIR)$(PREFIX)$(LICENSES)/$(PKGNAME)"
	install  -m644 -- LICENSE "$(DESTDIR)$(PREFIX)$(LICENSES)/$(PKGNAME)"

