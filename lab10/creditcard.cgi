#!/usr/bin/perl -w
# validate a credit card number by calculating its
# checksum using Luhn's formula (https://en.wikipedia.org/wiki/Luhn_algorithm)

use CGI qw/:all/;
use CGI::Carp qw/fatalsToBrowser warningsToBrowser/;

print header, start_html("Credit Card Validation"), "\n";
warningsToBrowser(1);
$credit_card = param("credit_card");
$substr = 'invalid';
print '<h2>Credit Card Validation</h2>';

if (defined param('close') && param('close') eq "Close"){
    print "Thank you for using the Credit Card Validator.\n";
} elsif (defined $credit_card) {
    print "This page checks whether a potential credit card number satisfies the Luhn Formula.\n";
    print '<p></p>';
    print "<form>", "\n";
    if (index(validate($credit_card), $substr) != -1){
        $credit_card =~ s/\</&lt;/g;
        $credit_card =~ s/\>/&gt;/g;
        print "<b><span style=\"color: red\">", validate($credit_card), "</span></b>";
        print '<p>';
        print "Try Again:\n", textfield('credit_card'), "\n";
        print submit(submit => Validate), " ";
        print reset(Reset => "Reset"), " ";
        print submit(close => "Close"), "\n";
        print '</p>';
    } else {
        print '<p>';
        $credit_card =~ s/\</&lt;/g;
        $credit_card =~ s/\>/&gt;/g;
        print validate($credit_card), "\n";
        print "</p>";
        print "<p>";
        print "Enter another credit card number:\n", textfield('credit_card'), "\n";
        print submit(submit => "Validate"), " ";
        print reset(Reset => "Reset"), " ";
        print submit(close => "Close"), "\n";
        print '</p>';
    }
    print '</form>';
} else {
    print "This page checks whether a potential credit card number satisfies the Luhn Formula.\n";
    print '<p></p>';
    print "<form>", "\n";
    print '<p>';
    print "Enter credit card number:\n", textfield('credit_card'), "\n";
    print submit(submit => Validate), " ";
    print reset(Reset => "Reset"), " ";
    print submit(close => "Close"), "\n";
    print '</p>';
    print '</form>';
}
print end_html;
exit 0;

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
