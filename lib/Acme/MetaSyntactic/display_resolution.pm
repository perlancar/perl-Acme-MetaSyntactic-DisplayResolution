package Acme::MetaSyntactic::display_resolution;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

use parent 'Acme::MetaSyntactic::List';
use Display::Resolution qw(list_display_resolution_names);

__PACKAGE__->init(do {
    my $names0 = list_display_resolution_names();
    my $names = {};
    for (keys %$names0) {
        next unless /\A[A-Za-z][A-Za-z0-9_]*\z/;
        $names->{lc $_} = 1;
    }
    { names => join(" ", sort keys %$names) };
});

1;
# ABSTRACT: Display resolution names

=for Pod::Coverage ^(.+)$

=head1 SYNOPSIS

 % perl -MAcme::MetaSyntactic=display_resolution -le 'print metaname'
 qhd

 % meta countries 2
 fhd
 wxga


=head1 DESCRIPTION

This theme includes display resolution names retrieved from
L<Display::Resolution>. Only names that start with letters and contain only
letters/numbers are included. The names are lowercased.


=head1 SEE ALSO

L<Acme::MetaSyntactic>

L<Display::Resolution>
