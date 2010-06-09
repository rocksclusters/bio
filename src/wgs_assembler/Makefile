# $Id: Makefile,v 1.1 2010/06/09 04:57:36 anoop Exp $

# @Copyright@
# @Copyright@

# $Log: Makefile,v $
# Revision 1.1  2010/06/09 04:57:36  anoop
# Added the Celera Whole Genome Sequence assembler.
# Thanks to Brett Whitty for the info.
#

REDHAT.ROOT = $(CURDIR)/../..
-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

PKGROOT = /opt/bio/$(NAME)

build:
	bzcat $(NAME)-$(VERSION).tar.bz2 | $(TAR) -xf -
	(						\
		cd $(NAME)-$(VERSION)/src;		\
		$(MAKE);				\
	)
	(						\
		cd $(NAME)-$(VERSION)/kmer;		\
		sh ./configure.sh;			\
		$(MAKE) install;			\
	)

install::
	( cd $(NAME)-$(VERSION)/kmer && 	\
		find $(BINDIR) -type f | 	\
		cpio -pudv ../ )
	( cd $(NAME)-$(VERSION)/$(BINDIR) && 	\
		find bin lib include -type f | 	\
		cpio -pudv $(ROOT)/$(PKGROOT) )

clean::
	rm -rf $(NAME)-$(VERSION)
