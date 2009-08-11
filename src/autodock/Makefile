# $Id: Makefile,v 1.1 2009/08/11 00:31:05 anoop Exp $

# @Copyright@
# @Copyright@

# $Log: Makefile,v $
# Revision 1.1  2009/08/11 00:31:05  anoop
# Added autodock 4.2.1 to the Bio roll
#

REDHAT.ROOT = $(CURDIR)/../..
PKGROOT = /opt/$(ROLL)

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

build:
	gunzip -c $(NAME)-$(VERSION).tar.gz | $(TAR) -xf -
	(cd patch-files && find . -type f | cpio -mpudv ../ )
	(						\
		cd $(NAME)-$(VERSION)/src/autodock/;	\
		./configure --prefix=$(PKGROOT);	\
		$(MAKE);				\
	);
	(						\
		cd $(NAME)-$(VERSION)/src/autogrid/;	\
		./configure --prefix=$(PKGROOT);	\
		$(MAKE);				\
	);

install::
	mkdir -p $(ROOT)/$(PREFIX)
	(						\
		cd $(NAME)-$(VERSION)/src/autodock/;	\
		$(MAKE) prefix=$(ROOT)/$(PKGROOT) install;\
	);
	(						\
		cd $(NAME)-$(VERSION)/src/autogrid/;	\
		$(MAKE) prefix=$(ROOT)/$(PKGROOT) install;\
	);

clean::
	rm -rf $(NAME)-$(VERSION)
