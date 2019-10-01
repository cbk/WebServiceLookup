class Lookup {
    use HTTP::UserAgent;
    use JSON::Pretty;

    has $.Sid;
    has $.Token;
    has $.agent = "Chrome/41.";

    my $webAgent = HTTP::UserAgent.new(useragent => "Chrome/41." );
    $webAgent.timeout = 10;

    method lookup( Str:D $phoneNumber ) {
        my $process = shell("curl -XGET 'https://lookups.twilio.com/v1/PhoneNumbers/{ $phoneNumber }?Type=carrier&Type=caller-name' -u '{ $.Sid }:{ $.Token }' ", :out, :err);
        my $captured-output = ~$process.out.get;
        my $data = from-json( $captured-output );
        # Convert output into json obj
        my $output = to-json($data);
        # Format json obj
        return $output;
    }
}