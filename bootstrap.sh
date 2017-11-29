#!/bin/sh
#
# This file should remain OS independent
#
# $Id: bootstrap.sh,v 1.23 2013/02/04 05:42:11 phil Exp $
#
# @Copyright@
# 
# 				Rocks(r)
# 		         www.rocksclusters.org
# 		         version 6.2 (SideWindwer)
# 		         version 7.0 (Manzanita)
# 
# Copyright (c) 2000 - 2017 The Regents of the University of California.
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
# $Log: bootstrap.sh,v $
# Revision 1.23  2013/02/04 05:42:11  phil
# fftw is now opt-fftw. Fix bootstrap and manifest
#
# Revision 1.22  2012/11/27 00:48:52  phil
# Copyright Storm for Emerald Boa
#
# Revision 1.21  2012/05/06 05:48:50  phil
# Copyright Storm for Mamba
#
# Revision 1.20  2011/07/23 02:30:53  phil
# Viper Copyright
#
# Revision 1.19  2011/07/21 18:40:21  anoop
# *** empty log message ***
#
# Revision 1.18  2010/09/07 23:53:10  bruno
# star power for gb
#
# Revision 1.17  2009/11/21 00:27:00  anoop
# Disable bioperl-support, libxml2, libxslt for SunOS
#
# Revision 1.16  2009/11/20 03:35:44  anoop
# BioPerl and supporting infrastructure
#
# Revision 1.15  2009/06/04 22:54:48  anoop
# Upgraded Bioperl and it's dependencies
#
# Revision 1.14  2009/05/22 06:57:43  anoop
# Bug fix, IoLib is required for bioperl-ext
#
# Revision 1.13  2009/05/01 19:07:10  mjk
# chimi con queso
#
# Revision 1.12  2008/10/18 00:56:03  mjk
# copyright 5.1
#
# Revision 1.11  2008/10/15 20:13:03  mjk
# - more changes to build outside of the tree
# - removed some old fds-only targets
#
# Revision 1.10  2008/04/07 20:55:17  anoop
# Fix Build bugs
#
# Revision 1.9  2008/03/06 23:41:46  mjk
# copyright storm on
#
# Revision 1.8  2007/06/23 04:03:26  mjk
# mars hill copyright
#
# Revision 1.7  2006/10/15 19:13:31  anoop
# Small Build changes. Version 4.2.1.1
#
# Will remove version info after new CD is spun.
#
# Revision 1.6  2006/09/15 00:29:43  anoop
# Added gromacs and fftw to the bioroll
#
# Revision 1.5  2006/09/11 22:47:31  mjk
# monkey face copyright
#
# Revision 1.4  2006/08/10 00:09:47  mjk
# 4.2 copyright
#
# Revision 1.3  2006/07/13 19:27:47  anoop
# Stupid bootstrap bug fixed
#
# Revision 1.2  2006/07/13 18:02:50  anoop
# Cleaned up the code a bit.
# Build requirements have their own xml file
# ReportLab changed to reportlab to avoid naming conflicts
# reportlab is now added as a build requirement for biopython
#
# Revision 1.1  2006/06/27 20:32:22  bruno
# bootstrap the bio roll
#
#

if [ ! -f "$ROLLSROOT/../../bin/get_sources.sh" ]; then
	echo "To compile this roll on Rocks 6.1.1 or older you need to install a newer rocks-devel rpm.
Install it with:
rpm -Uvh https://googledrive.com/host/0B0LD0shfkvCRRGtadUFTQkhoZWs/rocks-devel-6.2-3.x86_64.rpm
If you need an older version of this roll you can get it from:
https://github.com/rocksclusters-attic"
	exit 1
fi

. $ROLLSROOT/etc/bootstrap-functions.sh

install_os_packages bio-req

compile_and_install reportlab

compile fftw
install opt-fftw

if [ `./_os` == "linux" ]; then
	compile_and_install iolib
	compile libxml2
	install bio_libxml2

	compile libxslt
	install bio_libxslt

	( cd src/bioperl-support && gmake bootstrap )
fi
