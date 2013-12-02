PREFIX = /usr
SYSCONF = /etc
DATA = /share
LICENSES = $(DATA)/licenses
PKGNAME = system-configurations

SRC_ETC = host.conf  hosts  issue  ld.so.conf  nsswitch.conf  os-release  pony-release  securetty  shells


.PHONY: all clean
all:
clean:


.PHONY: install
install:
	install -dm755 --                                     "$(DESTDIR)$(SYSCONF)"
	install  -m644 -- $(foreach S, $(SRC_ETC), etc/$(S))  "$(DESTDIR)$(SYSCONF)"
	install -dm755 --                                     "$(DESTDIR)$(PREFIX)$(LICENSES)/$(PKGNAME)"
	install  -m644 -- LICENSE                             "$(DESTDIR)$(PREFIX)$(LICENSES)/$(PKGNAME)"


.PHONY: uninstall
uninstall:
	-rm    -- "$(DESTDIR)$(PREFIX)$(LICENSES)/$(PKGNAME)/COPYING"
	-rm    -- "$(DESTDIR)$(PREFIX)$(LICENSES)/$(PKGNAME)/LICENSE"
	-rm -d -- "$(DESTDIR)$(PREFIX)$(LICENSES)/$(PKGNAME)"

