# $Id: Makefile,v 1.2 2010/03/24 21:47:57 anoop Exp $

# @Copyright@
# @Copyright@

# $Log: Makefile,v $
# Revision 1.2  2010/03/24 21:47:57  anoop
# Update bioperl-ext
#
# Revision 1.1  2009/11/20 03:34:57  anoop
# BioPerl and supporting infrastructure
#

REDHAT.ROOT=$(CURDIR)/../..
-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

build:
	gunzip -c $(ARCHIVE_NAME)-$(VERSION).tar.gz | $(TAR) xf -
	-(cd patch-files; \
	  find $(ARCHIVE_NAME)-$(VERSION) -type f | \
		grep -v CVS | cpio -pudv ../)
	(cd $(ARCHIVE_NAME)-$(VERSION); \
	 IOLIB_INC="/opt/rocks/include -I/opt/rocks/include/io_lib" \
	 IOLIB_LIB="/opt/rocks/lib" $(PERL) Makefile.PL < /dev/null;\
	 $(MAKE))

install::
	(cd $(ARCHIVE_NAME)-$(VERSION); \
	$(MAKE) install DESTDIR=$(ROOT);)
	(cd $(ARCHIVE_NAME)-$(VERSION)/Bio/SeqIO/staden; \
	$(PERL) Makefile.PL < /dev/null;\
	$(MAKE) install DESTDIR=$(ROOT);)
	(cd $(ARCHIVE_NAME)-$(VERSION)/Bio/Ext/Align; \
	$(PERL) Makefile.PL < /dev/null;\
	$(MAKE) install DESTDIR=$(ROOT);)
	
clean::
	rm -rf $(ARCHIVE_NAME)-$(VERSION)
