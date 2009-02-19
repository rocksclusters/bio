use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'	=> 'Bio::Ext::Align',
    'VERSION'	=> '1.6.0',
    'LIBS'	=> ['-lm'],   # e.g., '-lm' 
    'DEFINE'	=> '-DPOSIX -DNOERROR',     # e.g., '-DHAVE_SOMETHING' 
    'INC'	=> '-I./libs',     # e.g., '-I/usr/include/other'
    'CCFLAGS'   => '-fPIC',
    'MYEXTLIB'  => 'libs/libsw$(LIB_EXT)',
    'clean'     => { 'FILES' => 'libs/*.o libs/*.a' }
);

sub MY::postamble{
'
$(MYEXTLIB): 
	DEFINE=\'$(DEFINE)\'; CC=\'$(PERLMAINCC)\'; CFLAGS=\'$(CCFLAGS)\'; export DEFINE INC CC CFLAGS; \
	cd libs && $(MAKE) CC=\'$(PERLMAINCC)\' CFLAGS=\'$(CCFLAGS) $(DEFINE)\' DEFINE=\'$(DEFINE)\' libsw$(LIB_EXT) -e ; \
    $(RANLIB) libsw$(LIB_EXT)
';
}
