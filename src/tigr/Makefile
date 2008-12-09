# $Id: Makefile,v 1.2 2008/12/09 20:03:52 anoop Exp $

# @Copyright@
# @Copyright@

# $Log: Makefile,v $
# Revision 1.2  2008/12/09 20:03:52  anoop
# Solaris doesn't like '_' in the name
#
# Revision 1.1  2008/12/09 19:55:43  anoop
# Added the TIGR Assembler to the bio roll
#

REDHAT.ROOT	=	$(CURDIR)/../../
PKGROOT		=	/opt/$(ROLL)/$(NAME)

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

build:
	gunzip -c $(ARCHIVE_NAME)_$(VERSION).tar.gz | $(TAR) -xf -
	(\
		cd $(ARCHIVE_NAME)_$(VERSION)/src;	\
		$(MAKE);			\
	)

install::
	mkdir -p $(ROOT)/$(PKGROOT)
	(\
		cd $(ARCHIVE_NAME)_$(VERSION);	\
		$(INSTALL) -m0755 -d $(ROOT)/$(PKGROOT)/bin;	\
		$(INSTALL) -m0755 -d $(ROOT)/$(PKGROOT)/obj;	\
		$(INSTALL) -m0755 bin/* $(ROOT)/$(PKGROOT)/bin;\
		$(INSTALL) -m0755 obj/* $(ROOT)/$(PKGROOT)/obj;\
	)

clean::
	rm -rf $(ARCHIVE_NAME)_$(VERSION)
