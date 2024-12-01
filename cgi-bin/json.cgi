#! /usr/bin/perl
use strict;
use warnings;
use CGI qw(:standard);
use JSON;

my %rec_hash = ("message" => "Hello World in JSON");
my $json = encode_json(\%rec_hash);

print header('application/json');
print $json;
