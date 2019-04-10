SHELL := /bin/bash

VERSION := 3.7.3-2
WORKDIR := python3.7-$(shell cut -d- -f1 <<< '$(VERSION)')

.PHONY: builddeb
builddeb:
	dget -x http://ftp.debian.org/debian/pool/main/p/python3.7/python3.7_$(VERSION).dsc
	cd $(WORKDIR) \
		&& DEBFULLNAME='Chris Kuehl' DEBEMAIL=ckuehl@ocf.berkeley.edu \
			dch --local ~deb9u --distribution stretch-backports 'Backported for stretch.' \
		&& DEB_BUILD_OPTIONS=nocheck dpkg-buildpackage -us -uc -sa
