#!/usr/bin/perl -w
# validate a credit card number by calculating its
# checksum using Luhn's formula (https://en.wikipedia.org/wiki/Luhn_algorithm)

foreach $arg (@ARGV){
    $response = validate($arg);
    print "$response";
}

sub luhn_checksum {
    $number = shift;
    $checksum = 0;
    @digits = reverse split(//, $number);

    for ($i = 1; $i < 0+@digits; $i+=2){
        $digits[$i] *= 2; 

        if ($digits[$i] > 9){
            $digits[$i] -= 9;
        }
    }

    for ($i = 0; $i < 0+@digits; $i++){
        $checksum += $digits[$i];
    }
    return $checksum;
}

sub validate {
    $num = shift;
    $sanitiser = $num;
    $sanitiser =~ s/\D//g;
    if (length $sanitiser != 16){
        return "$num is invalid - does not contain exactly 16 digits\n";
    } elsif (luhn_checksum($sanitiser) % 10 == 0){
        return "$num is valid\n";
    } else {
        return "$num is invalid\n";
    }

}