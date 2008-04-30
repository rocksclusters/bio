# $Id: Makefile,v 1.7 2008/04/02 23:44:02 anoop Exp $
#
# @Copyright@
# 
# 				Rocks(r)
# 		         www.rocksclusters.org
# 		            version 5.0 (V)
# 
# Copyright (c) 2000 - 2008 The Regents of the University of California.
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
# Revision 1.7  2008/04/02 23:44:02  anoop
# Upgraded reportlab
#
# Revision 1.6  2008/03/06 23:41:49  mjk
# copyright storm on
#
# Revision 1.5  2007/06/23 04:03:29  mjk
# mars hill copyright
#
# Revision 1.4  2006/12/02 01:04:57  anoop
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
# Revision 1.3  2006/09/11 22:47:44  mjk
# monkey face copyright
#
# Revision 1.2  2006/08/10 00:10:01  mjk
# 4.2 copyright
#
# Revision 1.1  2006/07/13 18:02:51  anoop
# Cleaned up the code a bit.
# Build requirements have their own xml file
# ReportLab changed to reportlab to avoid naming conflicts
# reportlab is now added as a build requirement for biopython
#
# Revision 1.7  2006/05/25 21:20:12  anoop
# Uses /opt/rocks/bin/python rather than /usr/bin/python
#
# Revision 1.6  2006/03/01 20:14:36  anoop
# Changed Biopython, numpy, and reportlab to use ordinary python rather than
# /opt/rocks/bin/python as that is not available for rocks-4.1
#
# amd64 makefile patches were missing for NAMD. So added those
#
# Revision 1.5  2006/01/04 22:45:18  anoop
#
# Now the Makefiles compile the applications correctly.
#
# The clustal tar ball is created from the correct directory, ie. it contains
# clustalw instead of clustalw1.83 as its top level directory.
#
# version.mk reflects version as 1.83 rather than 1.8
#
# Revision 1.6  2005/12/30 16:46:00  mjk
# copyrights in place
#
# Revision 1.5  2005/12/17 01:37:42  anoop
# *** empty log message ***
#
# Revision 1.4  2005/12/16 22:55:37  anoop
#
#
# Changed some makefiles to reflect required building order and changed rules
# for building.
#
# Revision 1.3  2005/12/15 19:45:00  anoop
# *** empty log message ***
#
# Revision 1.1  2005/12/15 00:11:33  anoop
# Biopython Package
#
#
#

PKGROOT = /opt/$(ROLL)/$(NAME)
REDHAT.ROOT = $(CURDIR)/../../
ROCKSROOT = ../../../../..

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

build ::
	tar -xzvf $(NAME)_2_1.tgz
	( \
		cd reportlab_2_1/reportlab; \
		$(PY.PATH) setup.py $@; \
	)

install test::
	( \
		cd reportlab_2_1/reportlab; \
		$(PY.PATH) setup.py $@ --root=$(ROOT)/ ; \
	)

clean::
	rm -f $(NAME).spec.in
	rm -rf $(NAME)
	rm -rf reportlab_2_1
