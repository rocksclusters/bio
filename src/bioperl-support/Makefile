# $Id: Makefile,v 1.12 2013/02/05 18:29:56 clem Exp $

# @Copyright@
# 
# 				Rocks(r)
# 		         www.rocksclusters.org
# 		         version 5.6 (Emerald Boa)
# 		         version 6.1 (Emerald Boa)
# 
# Copyright (c) 2000 - 2013 The Regents of the University of California.
# All rights reserved.	
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
# 
# 1. Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
# 
# 2. Redistributions in binary form must reproduce the above copyright
# notice unmodified and in its entirety, this list of conditions and the
# following disclaimer in the documentation and/or other materials provided 
# with the distribution.
# 
# 3. All advertising and press materials, printed or electronic, mentioning
# features or use of this software must display the following acknowledgement: 
# 
# 	"This product includes software developed by the Rocks(r)
# 	Cluster Group at the San Diego Supercomputer Center at the
# 	University of California, San Diego and its contributors."
# 
# 4. Except as permitted for the purposes of acknowledgment in paragraph 3,
# neither the name or logo of this software nor the names of its
# authors may be used to endorse or promote products derived from this
# software without specific prior written permission.  The name of the
# software includes the following terms, and any derivatives thereof:
# "Rocks", "Rocks Clusters", and "Avalanche Installer".  For licensing of 
# the associated name, interested parties should contact Technology 
# Transfer & Intellectual Property Services, University of California, 
# San Diego, 9500 Gilman Drive, Mail Code 0910, La Jolla, CA 92093-0910, 
# Ph: (858) 534-5815, FAX: (858) 534-7345, E-MAIL:invent@ucsd.edu
# 
# THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS''
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# 
# @Copyright@

# $Log: Makefile,v $
# Revision 1.12  2013/02/05 18:29:56  clem
# last fix to properly set the release number
#
# in makefile you need to expicitly export a variable to make it visible to the
# subshells
#
# Revision 1.11  2013/02/05 00:23:14  clem
# set release number of the rpms built with cpan
#
# Revision 1.10  2013/02/05 00:21:43  clem
# do not rebuild the packages we already have built
#
# Revision 1.9  2012/11/27 00:48:52  phil
# Copyright Storm for Emerald Boa
#
# Revision 1.8  2012/05/06 05:48:50  phil
# Copyright Storm for Mamba
#
# Revision 1.7  2011/07/23 02:30:53  phil
# Viper Copyright
#
# Revision 1.6  2011/07/21 18:13:41  anoop
# Add SVG as a custom source, because cpan2dist does not like
# it if you specify prerequisites without version numbers
#
# Revision 1.5  2010/09/07 23:53:11  bruno
# star power for gb
#
# Revision 1.4  2009/12/03 17:14:07  anoop
# Undo "--allow-mb-mismatch". Does not work from CPAN
#
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

# 
# You can use now RocksReleaseVersion to set the release version of the RPMs
# builded by cpan see below..
#
ifdef RELEASE
export RocksReleaseVersion = $(RELEASE)
endif

bootstrap:
	cat modules.build | while read line; do \
		XMLPREFIX=/opt/bio XSLTPREFIX=/opt/bio	\
		/opt/perl/bin/cpan \
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
		/opt/perl/bin/cpan2dist --format CPANPLUS::Dist::Rocks	\
		--ignorelist modules.ignore.tmp --buildprereq --force	\
		--install --verbose $$line < /dev/null;			\
		( find . -type f -name \*.rpm ! -name \*.src.rpm \
		-exec rpm -qlp {} \; |/usr/lib/rpm/find-provides \
		| grep -E "^perl\(" | sed -r -e 's/^perl\(/^/' 	 \
		  -e 's/\)[ \t]*(=[ \t]*[.0-9]+)*$$/$$/'\
	  	  && cat modules.ignore ) | sort | uniq \
		> modules.ignore.tmp; \
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
		-a ! -name answerfile		\
		-a ! -name version.mk		\
		-a ! -name CVS -exec rm -rf {} \;
	-rm -rf .gnupg
