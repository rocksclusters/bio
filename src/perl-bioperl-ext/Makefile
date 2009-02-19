# $Id: Makefile,v 1.1 2009/02/19 18:42:18 anoop Exp $

# @Copyright@
# @Copyright@

# $Log: Makefile,v $
# Revision 1.1  2009/02/19 18:42:18  anoop
# Added iolib and bioperl-ext to the Bio Roll.
#

PKGROOT = /opt/rocks
REDHAT.ROOT = $(CURDIR)/../../

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

build:
	gunzip -c $(ARCHIVE_NAME).tar.gz | $(TAR) -xf -
	(cd patch-files && find . -type f | cpio -pudv ../$(ARCHIVE_NAME))
	(\
		cd $(ARCHIVE_NAME);	\
		$(PERL) Makefile.PL;	\
		$(MAKE);	\
	)

install::
	(\
		cd $(ARCHIVE_NAME);	\
		$(MAKE) install DESTDIR=$(ROOT);\
	)

clean::
	rm -rf $(ARCHIVE_NAME)
