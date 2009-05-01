# $Id: Makefile,v 1.14 2009/05/01 19:07:13 mjk Exp $
#
# @Copyright@
# 
# 				Rocks(r)
# 		         www.rocksclusters.org
# 		       version 5.2 (Chimichanga)
# 
# Copyright (c) 2000 - 2009 The Regents of the University of California.
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
#
# $Log: Makefile,v $
# Revision 1.14  2009/05/01 19:07:13  mjk
# chimi con queso
#
# Revision 1.13  2008/12/10 03:29:36  anoop
# BioRoll Upgrade
#
# Revision 1.12  2008/11/26 21:37:38  anoop
# Merged back from changes in the mercurial repository
#
# Revision 1.11  2008/10/18 00:56:06  mjk
# copyright 5.1
#
# Revision 1.10  2008/04/04 18:20:13  anoop
# Fix build bugs
#
# Revision 1.9  2008/04/02 23:43:38  anoop
# Upgraded phylip
#
# Revision 1.8  2008/03/06 23:41:49  mjk
# copyright storm on
#
# Revision 1.7  2007/06/23 04:03:29  mjk
# mars hill copyright
#
# Revision 1.6  2006/12/02 01:04:57  anoop
# Ridiculously big ass commit.
# Also known as the week after thanksgiving 2006. Or "The day Anoop
# broke Rocks".
#
# Main Changes.
#
# 1. Added a roll-profile.mk file. This is meant as a makefile for building
# the profile rpm containing all the XML files meant for the roll. This is a
# breakaway from the spec.in file method of building the profile RPM.
#
# 2. The variable PWD is now changed to CURDIR. The main reason for this is
# PWD is supplied by the shell. CURDIR is the variable supplied by gmake itself.
# This means we can have a slightly more platform independant way of doing things.
# Also Solaris was failing to set PWD correctly in the source directories, wreaking
# havoc on the location of the BUILD and PKG directories.
#
# Revision 1.5  2006/09/11 22:47:44  mjk
# monkey face copyright
#
# Revision 1.4  2006/08/10 00:10:01  mjk
# 4.2 copyright
#
# Revision 1.3  2006/03/16 02:52:10  anoop
# Lots of changes to the roll
#
# Upgraded T_coffee
# modified mrbayes to work better
# modified phylip to work better
# upgraded fasta to install and work correctly
# Put in a little more documentation
#
# Revision 1.2  2006/03/01 21:39:48  anoop
# Modified the phylip internal makefile to build properly for x86_64 as well.
#
# Revision 1.1  2006/02/21 02:06:03  anoop
# Initial Addition of phylip
#

PKGROOT = /opt/$(ROLL)/$(NAME)
REDHAT.ROOT = $(CURDIR)/../../

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk


build:
	gunzip -c $(NAME)-$(VERSION).tar.gz | $(TAR) -xf -
	(\
		cd $(NAME)-$(VERSION)/src; \
		$(MAKE) CC=$(CC) DFLAGS=$(DFLAGS) install; \
	)

install::
	mkdir -p $(ROOT)/$(PKGROOT)
	( \
		cd $(NAME)-$(VERSION); \
		cp -rf doc/ phylip.html exe/ $(ROOT)/$(PKGROOT)/;\
	)

clean::
	rm -f $(NAME).spec.in
	rm -rf $(NAME)-$(VERSION)
