# $Id: Makefile,v 1.1 2009/02/19 18:42:17 anoop Exp $

# @Copyright@
# @Copyright@

# $Log: Makefile,v $
# Revision 1.1  2009/02/19 18:42:17  anoop
# Added iolib and bioperl-ext to the Bio Roll.
#

PKGROOT = /opt/rocks
REDHAT.ROOT = $(CURDIR)/../../

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

build:
	gunzip -c $(NAME)-$(VERSION).$(RELEASE).tar.gz | $(TAR) -xf -
	(\
		cd $(NAME)-$(VERSION); \
		./configure --prefix=$(PKGROOT) \
			CFLAGS=-fPIC;		\
	);

install::
	(\
		cd $(NAME)-$(VERSION);	\
		$(MAKE) prefix=$(ROOT)/$(PKGROOT) install; \
	);

clean::
	rm -rf $(NAME)-$(VERSION)
