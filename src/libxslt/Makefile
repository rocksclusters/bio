# $Id: Makefile,v 1.1 2009/11/19 20:31:11 anoop Exp $

# @Copyright@
# @Copyright@

# $Log: Makefile,v $
# Revision 1.1  2009/11/19 20:31:11  anoop
# Added libxml2 and libxslt for bioperl support infrastructure
# These are installed in /opt/bio and will not interefere with
# foundation of Rocks
#

PKGROOT = /opt/$(ROLL)
REDHAT.ROOT = $(CURDIR)/../../

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

build:
	gunzip -c $(ARCHIVENAME)-$(VERSION).tar.gz | $(TAR) -xf -
	(						\
		cd $(ARCHIVENAME)-$(VERSION);		\
		PERL=$(PERL) ./configure --prefix=$(PKGROOT)	\
			--with-libxml-prefix=$(PKGROOT)	\
			--without-python;	\
		$(MAKE);			\
	)

install::
	(						\
		cd $(ARCHIVENAME)-$(VERSION);		\
		$(MAKE) prefix=$(ROOT)/$(PKGROOT) install; \
	)

clean::
	rm -rf $(ARCHIVENAME)-$(VERSION)
