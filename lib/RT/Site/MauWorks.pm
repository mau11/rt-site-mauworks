use strict;
use warnings;
package RT::Site::MauWorks;

our $VERSION = '0.01';

=head1 NAME

RT-Site-MauWorks - [One line description of module's purpose here]

=head1 DESCRIPTION

[Why would someone install this extension? What does it do? What problem
does it solve?]

=head1 RT VERSION

Works with RT [What versions of RT is this known to work with?]

[Make sure to use requires_rt and rt_too_new in Makefile.PL]

=head1 INSTALLATION

=over

=item C<perl Makefile.PL>

=item C<make>

=item C<make install>

May need root permissions

=item Edit your F</opt/rt4/etc/RT_SiteConfig.pm>

Add this line:

    Plugin('RT::Site::MauWorks');

=item Clear your mason cache

    rm -rf /opt/rt4/var/mason_data/obj

=item Restart your webserver

=back

=head1 AUTHOR

Maureen

=head1 BUGS

All bugs should be reported via email to

  L<admin@mauworks.com|mailto:admin@mauworks.com>

=head1 LICENSE AND COPYRIGHT

This software is Copyright (c) 2018 by Maureen

This is free software, licensed under:

  The GNU General Public License, Version 2, June 1991

=cut

1;
