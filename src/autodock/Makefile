# $Id: Makefile,v 1.3 2009/11/19 01:05:01 anoop Exp $

# @Copyright@
# @Copyright@

# $Log: Makefile,v $
# Revision 1.3  2009/11/19 01:05:01  anoop
# Updated autodock
#
# Revision 1.2  2009/08/11 19:43:25  anoop
# Minor Bug fixes for autodock
#
# Revision 1.1  2009/08/11 00:31:05  anoop
# Added autodock 4.2.1 to the Bio roll
#

REDHAT.ROOT = $(CURDIR)/../..
PKGROOT = /opt/$(ROLL)/$(NAME)

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

build:
	mkdir -p $(NAME)-$(VERSION)
	gunzip -c $(NAME)-$(VERSION)-src.tar.gz | ( cd $(NAME)-$(VERSION) && $(TAR) -xf - )
	(cd patch-files && find . -type f | grep -v CVS | cpio -mpudv ../ )
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
