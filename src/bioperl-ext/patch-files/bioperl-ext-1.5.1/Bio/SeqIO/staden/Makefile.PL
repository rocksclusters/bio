use Inline::MakeMaker;
use Config;

WriteInlineMakefile(
		    'NAME'		=> 'Bio::SeqIO::staden::read',
		    'VERSION'		=> '0.01',
		    'PREREQ_PM'		=> { 'Inline::C' => 0.0,
					     'Bio::SeqIO::abi' => 0.0,
					   }, # e.g., Module::Name => 1.1,
		    test                => { TESTS => 'test.pl' },
		   );

sub MY::test_via_script {
    package MY;
    my $self = shift;
    return ''; # prevent double-run of test.pl
}

sub MY::post_initialize {
    package MY;
    my $self = shift;

    my ($iolibinc, $ioliblib) = @ENV{qw(IOLIB_INC IOLIB_LIB)};

    unless ($ioliblib) {
	($ioliblib) = grep { defined } map { m/^IOLIB_LIB\=(\S+)/o ? $1 : undef } @ARGV;
    }
    unless ($iolibinc) {
	($iolibinc) = grep { defined } map { m/^IOLIB_INC\=(\S+)/o ? $1 : undef } @ARGV;
    }

    # guess wildly!!
    unless ($ioliblib) {
	my @d;
	for my $test (split(/\s+/, $main::Config{libpth}), $self->{LIB}) {
	    next unless $test;
	    eval { local $SIG{__WARN__} = sub { }; @d = $self->ext("-L$test -lread") };
	    if ($d[3] eq $test) {
		$ioliblib = $test;
		warn "Found Staden io_lib \"libread\" in $ioliblib ...\n";
		unless ($iolibinc) {
		    $iolibinc = $test;
		    $iolibinc =~ s/lib$/include/;
		    $iolibinc = $self->catdir($iolibinc, "io_lib");
		    unless (-e $self->catfile($iolibinc, "Read.h")) {
			undef $iolibinc;
		    } else {
			warn "Automatically using the Read.h found in $iolibinc ...\n";
		    }
		}
		last;
	    }
	}
    }

    unless ($ioliblib) {
	$ioliblib = ExtUtils::MakeMaker::prompt("Please tell us where your Staden io_lib \"read\" library is installed: ", "/usr/local/lib");
    }

    unless ($iolibinc) {
	my $prompt;
	if ($ioliblib) {
	    $prompt = $ioliblib;
	    $prompt =~ s/lib$/include/;
	    $prompt = $self->catdir($prompt, "io_lib");
	} else {
	    $prompt = "/usr/local/include/io_lib";
	}
	$iolibinc = ExtUtils::MakeMaker::prompt("Please tell us where your Staden io_lib \"Read.h\" header is installed: ", $prompt);
    }

    `perl -pi -e 's{(LIBS\\s*=>\\s*")([^"]+)}{\$1-L$ioliblib -lread -lz};' read.pm`;
    `perl -pi -e 's{(INC\\s*=>\\s*")([^"]+)}{\$1-I$iolibinc};' read.pm`;

    return '';
}
