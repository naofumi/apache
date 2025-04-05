#! /usr/bin/perl
use strict;
use warnings;
use YAML::XS 'LoadFile';

my $yaml_file = 'recaps.yml';
my $recaps = LoadFile($yaml_file);

print "Status: 200\n";
print "Content-type: text/html\n\n";
foreach my $recap (@$recaps) {
    print "<h2 class=\"recap__heading\">$recap->{date}</h2>\n";
    print "<div class=\"recap__content\">";
    print "<dl>";
    foreach my $item (@{$recap->{items}}) {
        print "<dt>$item->{title}</dt>\n";
        print "<dd>$item->{content}</dd>\n";
    }
    print "</dl>";
    print "</div>\n";
};
