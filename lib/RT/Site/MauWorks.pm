use strict;
use warnings;
package RT::Site::MauWorks;

our $VERSION = '0.01';

# Add css files to the @CSSFiles config
RT->AddStyleSheets('main.css');

=head1 NAME

RT-Site-MauWorks

=head1 DESCRIPTION

Track orders for all Mau Works purchases and gifts

=head1 RT VERSION

Works with RT 4.4

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
