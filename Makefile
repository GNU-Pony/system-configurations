PREFIX       = /usr
SYSCONF      = /etc
DATA         = /share
LICENSES     = $(DATA)/licenses
PKGNAME      = system-configurations

SRC_ETC      = fstab          host.conf   hosts         issue    ld.so.conf  login.defs  \
               nsswitch.conf  os-release  pony-release  profile  securetty   shells      \
               ld.so.conf.d/local.conf
TOUCH_ETC    = resolv.conf    crypttab


.PHONY: all clean
all:
clean:


.PHONY: install
install: install-license install-files


.PHONY: install-files
install-files:
	$(foreach S,         $(SRC_ETC),install -Dm644 -- "etc/$(S)" "$(DESTDIR)$(SYSCONF)/$(S)";)
	touch -- $(foreach S,$(TOUCH_ETC),                           "$(DESTDIR)$(SYSCONF)/$(S)")


.PHONY: install-license
install-license:
	install -dm755 --         "$(DESTDIR)$(PREFIX)$(LICENSES)/$(PKGNAME)"
	install  -m644 -- LICENSE "$(DESTDIR)$(PREFIX)$(LICENSES)/$(PKGNAME)"

