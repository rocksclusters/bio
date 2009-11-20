# $Id: Makefile,v 1.4 2009/11/20 03:34:57 anoop Exp $

# @Copyright@
# @Copyright@

# $Log: Makefile,v $
# Revision 1.4  2009/11/20 03:34:57  anoop
# BioPerl and supporting infrastructure
#

REDHAT.ROOT = $(CURDIR)/../../
MAKE.iscontrib = 1
-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

bootstrap:
	cat modules.build | while read line; do \
		/opt/rocks/bin/cpan \
		$$line < /dev/null; \
		done

# Build target works in an interesting way
# For every module that is built along with it's dependencies
# make sure we add all the modules that it provides to 
# the modules.ignore file so that they don't get rebuilt
build:
	cp modules.ignore modules.ignore.tmp
	cat modules.build | while read line; do 	\
		/opt/rocks/bin/cpan2dist		\
		--format CPANPLUS::Dist::Rocks		\
		--ignorelist modules.ignore.tmp --force	\
		--buildprereq --install --verbose	\
		$$line < /dev/null;		\
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
		-exec rm -rf {} \;
