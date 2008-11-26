# $Id: Makefile,v 1.11 2008/11/26 21:37:36 anoop Exp $
#
# @Copyright@
# 
# 				Rocks
# 		         www.rocksclusters.org
# 		           version 4.1 (fuji)
# 
# Copyright (c) 2005 The Regents of the University of California. All
# rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
# 
# 1. Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
# 
# 2. Redistributions in binary form must reproduce the above copyright
# notice, this list of conditions and the following disclaimer in the
# documentation and/or other materials provided with the distribution.
# 
# 3. All advertising materials mentioning features or use of this
# software must display the following acknowledgement: 
# 
# 	"This product includes software developed by the Rocks 
# 	Cluster Group at the San Diego Supercomputer Center and
# 	its contributors."
# 
# 4. Neither the name or logo of this software nor the names of its
# authors may be used to endorse or promote products derived from this
# software without specific prior written permission.  The name of the
# software includes the following terms, and any derivatives thereof:
# "Rocks", "Rocks Clusters", and "Avalanche Installer".
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
# $Log: Makefile,v $
# Revision 1.11  2008/11/26 21:37:36  anoop
# Merged back from changes in the mercurial repository
#
# Revision 1.10  2008/07/10 17:15:39  anoop
# Bug fixes to the build
#
# Revision 1.9  2008/04/04 18:20:13  anoop
# Fix build bugs
#
# Revision 1.8  2006/12/02 01:04:55  anoop
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
# Revision 1.7  2006/07/13 19:28:36  anoop
# *** empty log message ***
#
# Revision 1.6  2006/05/25 20:44:31  anoop
# Changed the export directory for the blast databases from /share/apps/bio
# to /share/bio
#
# Revision 1.5  2006/03/10 15:03:08  anoop
# NAMD is not going to be built with the distribution, until I get confirmation
# from Jim Philips of UIUC, that I may re-enable NAMD build.
#
# Revision 1.4  2006/02/08 20:42:24  anoop
# Initial commit of the mpiblast program. This required a few changes to the
# ncbi-blast toolset, along with rather an unusual way of building mpiblast,
# as mpiblast requires the presence of patched & compiled source code of ncbi-blast
# to be present.
#
# Revision 1.3  2005/12/16 22:55:37  anoop
#
#
# Changed some makefiles to reflect required building order and changed rules
# for building.
#
# Revision 1.2  2005/12/14 03:11:04  mjk
# added cvs tags back, roll builds
#

-include $(shell $(ROCKSROOT)/bin/os).mk
-include $(shell $(ROCKSROOT)/bin/arch).mk

default:	pkg

copyright rpm pkg clean::
	for i in $(SRCDIRS) ; do \
		(cd $$i; $(MAKE) $@) ; \
	done
