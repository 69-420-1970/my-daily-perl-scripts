#!/usr/bin/perl
use strict;
use warnings;
use File::Find;

@ARGV == 3 or die;


my $dir = $ARGV[0];
my $old_ext = $ARGV[1];
my $new_ext = $ARGV[2];

my @list;
find sub {
    push @list, $File::Find::name if -f && /\.\Q$old_ext\E\z/;
    }, $dir;

foreach my $old_name ( @list ) {
    my $new_name = $old_name =~ s/\.\Q$old_ext\E\z/.$new_ext/r;
    rename $old_name, $new_name or die;
}

#JFFcoding(0001)-(fd aka 69-420-1970)
