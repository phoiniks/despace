#!/usr/bin/perl -w
use strict;

=pod

=head1 NAME

despace.pl - utility for subsituting whitespace in file names with the underscore character

=head1 SYNOPSIS

despace.pl -- you don't need to provide any parameters, so this might
spare you some work when handling large amounts of files while
rename would require you to "rename s/ /_/g *.*" each time you're in need
of this functionality.

=head2 DESCRIPTION

This script is not strictly necessary on Debian, because we have rename.
Under archlinux, however, rename behaves sligthly different, so this might be an option.
Anyway, despace.pl substitutes whitespace in filenames with an underscore [_]
without needing any parameters -- unlike when using rename. This might come in
handy when working with, yes, large amounts of MICROSOFT files...

=head3 LICENSE

This piece of software is released under the ARIVA Artistic License.
See L<http://www.ariva.de>.

=head4 AUTHOR

agre - agre@ariva.de, andreas@grellopolis.de

=cut

use strict;
use File::Copy;

# agre@ariva.de, 6.1.2016, Sinn des Skripts: Leerzeichen aus Dateinamen entfernen
# und durch Unterstriche ersetzen.

my @files = glob("*");

foreach my $file ( @files ) {
    if ( -f $file  and $file =~ m/ /g) { # Nur Dateinamen, die Leerzeichen enthalten!
	my $destiny = $file;
	$destiny =~ s/[ \-]/_/g;
	printf "Benenne %s in %s um.\n", $file, $destiny;
	move($file, $destiny);
    }
}
