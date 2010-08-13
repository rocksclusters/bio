# $Id: Makefile,v 1.19 2010/08/13 18:50:14 anoop Exp $
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
# Revision 1.19  2010/08/13 18:50:14  anoop
# Upgraded mpiblast to the latest stable version.
# mpiBlast now uses it's own version of ncbi
#
# Revision 1.18  2009/05/01 19:07:11  mjk
# chimi con queso
#
# Revision 1.17  2008/12/10 03:29:27  anoop
# BioRoll Upgrade
#
# Revision 1.16  2008/11/26 21:37:36  anoop
# Merged back from changes in the mercurial repository
#
# Revision 1.15  2008/10/18 00:56:04  mjk
# copyright 5.1
#
# Revision 1.14  2008/07/10 17:15:39  anoop
# Bug fixes to the build
#
# Revision 1.13  2008/04/29 00:16:52  anoop
# Modified mpiblast build process to import ncbi tarball
# and ncbi patch-files from the ncbi-blast source rather
# than maintaining multiple copies of the same tarball &
# patchfiles
#
# Revision 1.12  2008/04/08 17:35:27  anoop
# Changed mpi from redhat provided openmpi to our own openmpi
#
# Revision 1.11  2008/04/02 23:40:21  anoop
# upgraded mpiblast to mpiblast-pio
#
# Revision 1.10  2008/03/06 23:41:47  mjk
# copyright storm on
#
# Revision 1.9  2007/11/30 19:39:43  anoop
# Small patch to clean up output of mpiformatdb
#
# Revision 1.8  2007/11/29 01:56:07  anoop
# MPIBlast now copies NCBI toolkit, builds it locally, and uses that
# to compile itself. Slightly cleaner design
#
# Revision 1.7  2007/11/29 00:22:48  anoop
# Latest version of MPIBlast
#
# Revision 1.6  2007/06/23 04:03:27  mjk
# mars hill copyright
#
# Revision 1.5  2006/12/02 01:04:56  anoop
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
# Revision 1.4  2006/09/11 22:47:33  mjk
# monkey face copyright
#
# Revision 1.3  2006/08/10 00:09:49  mjk
# 4.2 copyright
#
# Revision 1.2  2006/02/10 00:15:09  anoop
# MPI Blast now uses mpich rather than LAM mpi
#
# Revision 1.1  2006/02/08 20:42:24  anoop
# Initial commit of the mpiblast program. This required a few changes to the
# ncbi-blast toolset, along with rather an unusual way of building mpiblast,
# as mpiblast requires the presence of patched & compiled source code of ncbi-blast
# to be present.
#

PKGROOT = /opt/$(ROLL)/$(NAME)
REDHAT.ROOT = $(CURDIR)/../../

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

patch:
	gunzip -c $(ARCHIVE)-$(VERSION).tgz | $(TAR) -xf -
	(\
		cd patch-files/$(NAME)-$(VERSION); \
		find . -type f | grep -v CVS | \
			cpio -pudv ../../$(NAME)-$(VERSION);\
	)
	
build:
MPICC	= $(MPIROOT)/bin/mpicc
MPICXX	= $(MPIROOT)/bin/mpicxx
build: patch
	( \
		cd $(NAME)-$(VERSION); \
		./configure CC=$(MPICC) CXX=$(MPICXX)\
		CONFIG_LIBC=$(CONFIG_LIBC)	\
		--with-mpi=$(MPIROOT) \
		--prefix=$(PKGROOT); \
		$(MAKE) ncbi; \
		$(MAKE); \
	)
	
install::
	( \
		cd $(NAME)-$(VERSION); \
		$(MAKE) prefix=$(ROOT)/$(PKGROOT) install; \
	)

clean::
	rm -f $(NAME).spec.in
	rm -rf $(NAME)-$(VERSION)
