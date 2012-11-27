# $Id: bio.sh,v 1.3 2012/11/27 00:48:54 phil Exp $
#
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
#
# $Log: bio.sh,v $
# Revision 1.3  2012/11/27 00:48:54  phil
# Copyright Storm for Emerald Boa
#
# Revision 1.2  2012/05/06 05:48:52  phil
# Copyright Storm for Mamba
#
# Revision 1.1  2012/05/02 21:06:43  phil
# Move bio.sh bio.csh from node file to RPM
#
# 

# Put the bin directories of all the applications into the path.
export BIOROLL=${BIOROLL-"/opt/bio"}
PATHS="ncbi/bin mpiblast/bin EMBOSS/bin clustalw/bin tcoffee/bin"
PATHS+=" hmmer/bin phylip/exe mrbayes fasta glimmer/bin glimmer/scripts"
PATHS+=" gromacs/bin gmap/bin tigr/bin autodocksuite/bin wgs/bin"

for j in $PATHS; do 
	BIN=${BIOROLL}/$j
	if [ -d ${BIN} ]; then
		if ! echo ${PATH} | /bin/grep -q ${BIN} ; then
	        	export PATH=${PATH}:${BIN}
		fi
	fi
done

# NCBI
export BLASTDB=${BLASTDB-"$HOME/bio/ncbi/db"}
export BLASTMAT=${BLASTMAT-"$BIOROLL/ncbi/data"}
export HMMER_DB=${HMMER_DB-"$HOME/bio/hmmer/db"}

# Create startup files for "regular" users
# ========================================
if [ `/usr/bin/id -u` -ge 500 ]; then


# Create the ncbirc file as necessary
if [ ! -e $HOME/.ncbirc ]; then
cat > $HOME/.ncbirc << EOF
[NCBI]
Data=/opt/bio/ncbi/data/

[mpiBLAST]
Shared=$HOME/bio/ncbi/db/
Local=/tmp/$USER/db/

EOF
fi

if [ ! -e $HOME/bio/ncbi/db ]; then
	mkdir -p $HOME/bio/ncbi/db/
fi

# Create a bio directory to hold HMMER databases
if [ ! -e $HOME/bio/hmmer/db ]; then
	mkdir -p $HOME/bio/hmmer/db/
fi

# Create a .t_coffee directory
if [ ! -e $HOME/.t_coffee/tmp/ ]; then
	mkdir -p $HOME/.t_coffee/tmp
fi

fi
# ========================================

