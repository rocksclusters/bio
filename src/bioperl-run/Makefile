# $Id: Makefile,v 1.1 2009/11/20 03:34:57 anoop Exp $

# @Copyright@
# @Copyright@

# $Log: Makefile,v $
# Revision 1.1  2009/11/20 03:34:57  anoop
# BioPerl and supporting infrastructure
#

REDHAT.ROOT=$(CURDIR)/../..
-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

build:
	gunzip -c $(ARCHIVE_NAME)-$(VERSION)_$(RELEASE).tar.gz | $(TAR) xf -
	(cd $(ARCHIVE_NAME)-$(VERSION)_$(RELEASE);	\
	 $(PERL) Makefile.PL < /dev/null;\
	 $(MAKE))

install::
	(cd $(ARCHIVE_NAME)-$(VERSION)_$(RELEASE); \
	 $(MAKE) install DESTDIR=$(ROOT);\
	)
clean::
	rm -rf $(ARCHIVE_NAME)-$(VERSION)_$(RELEASE)
