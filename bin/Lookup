#!/usr/bin/env perl6
use WebService::Lookup;
#####################################################################
# Make new object and provide  account credentials
my $phone = Lookup.new(
        Sid => '',
        Token => '',
        );

#####################################################################
sub MAIN ( Str:D $phoneNumber ) {
    say $phone.lookup( $phoneNumber );
}
# vim: ft=perl6 noet
