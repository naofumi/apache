#! /usr/bin/perl
use 5.36.0;
use strict;
use warnings;
use CGI;
use lib 'inquiry';
use slack_message;


my $cgi = CGI->new;
my $slack = SlackMesssage->new;

if ($cgi->request_method eq "POST") {
    my $text = $cgi->param('text') || die("Text required for Inquiry");
    $slack->send($text);

    say "Status: 302";
    say "Location: /kanagawa-rb/inquiry/success";
    say "";
} else {
    die "Bad Request"
}
