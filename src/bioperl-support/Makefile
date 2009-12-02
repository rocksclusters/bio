# $Id: Makefile,v 1.3 2009/12/02 19:24:32 anoop Exp $

# @Copyright@
# @Copyright@

# $Log: Makefile,v $
# Revision 1.3  2009/12/02 19:24:32  anoop
# Don't force rebuild of Module::Build
#
# Revision 1.2  2009/11/21 00:27:00  anoop
# Disable bioperl-support, libxml2, libxslt for SunOS
#
# Revision 1.1  2009/11/20 03:34:58  anoop
# BioPerl and supporting infrastructure
#

REDHAT.ROOT = $(CURDIR)/../../
MAKE.iscontrib = 1
-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

bootstrap:
	cat modules.build | while read line; do \
		XMLPREFIX=/opt/bio XSLTPREFIX=/opt/bio	\
		/opt/rocks/bin/cpan --allow_mb_mismatch 1 \
		$$line < /dev/null; \
		done

# Build target works in an interesting way
# For every module that is built along with it's dependencies
# make sure we add all the modules that it provides to 
# the modules.ignore file so that they don't get rebuilt
build:
	cp modules.ignore modules.ignore.tmp
	cat modules.build | while read line; do 	\
		XMLPREFIX=/opt/bio XSLTPREFIX=/opt/bio	\
		/opt/rocks/bin/cpan2dist		\
		--format CPANPLUS::Dist::Rocks		\
		--ignorelist modules.ignore.tmp --force	\
		--buildprereq --install --verbose	\
		$$line < /dev/null;			\
		( find . -type f -name \*.rpm ! -name \*.src.rpm \
		  -exec rpm -qp --provides {} \; | grep ^perl\(  \
		  | cut -f1 -d' ' | sed -e 's/^perl(/^/g' -e 's/)$$/$$/g' \
		  && cat modules.ignore ) | sort | uniq > modules.ignore.tmp; \
	done

rpm:: build
	if [ ! -d $(REDHAT.ROOT)/RPMS ]; then mkdir -p $(REDHAT.ROOT)/RPMS; fi
	for i in `find . -type f -name \*.rpm ! -name \*.src.rpm`; do \
		rpmname=`basename $$i`; \
		arch=`echo $$rpmname | awk -F. '{print $$(NF-1);}'`; \
		echo $$arch; \
		if [ ! -d $(REDHAT.ROOT)/RPMS/$$arch ]; then \
			mkdir -p $(REDHAT.ROOT)/RPMS/$$arch; fi; \
		cp -rvf $$i $(REDHAT.ROOT)/RPMS/$$arch; \
	done
	
clean::
	find * -prune ! -name Makefile		\
		-a ! -name modules.build	\
		-a ! -name modules.ignore	\
		-a ! -name CVS -exec rm -rf {} \;
	-rm -rf .gnupg
