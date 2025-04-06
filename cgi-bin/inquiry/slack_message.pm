package SlackMesssage;
use 5.36.0;
use strict;
use warnings;
use LWP::UserAgent;
use JSON;

# Constructor
sub new {
    my ($class, %args) = @_;

    my $self = {
        webhook_url => $args{'webhook_url'} // $ENV{'SLACK_WEBHOOK_URL'},
        ua        => $args{'ua'} // LWP::UserAgent->new(timeout => 10)
    };

    bless $self, $class;
    return $self;
}

sub send {
    my ($self, $text) = @_;
    my $json_data = { 'text' => $text };

    my $json_response = $self->{ua}->post(
        $self->{webhook_url},
        'Content-Type' => 'application/json',
        Content => encode_json($json_data)
    );

    if ($json_response->is_success) {
        return 1;
    } else {
        die "Failed to send message: " . $json_response->status_line;
    }
}

1;
