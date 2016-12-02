#!/usr/bin/perl -w

use CGI qw/:all/;
use CGI::Carp qw/fatalsToBrowser warningsToBrowser/;

print header, start_html('Login');
warningsToBrowser(1);

$listOfAcc = 'accounts/';
opendir(DIR, "$listOfAcc") or die;
@acc = readdir(DIR) or die;
closedir(DIR);

$username = param('username') || '';
$password = param('password') || '';

if ($username && $password){
    foreach $line (@acc){
        if ($line eq $username){
            $checkuser = $line;
            last;
        }
    }
    if ($checkuser eq $username){
        $passCheck = "accounts/$username/password";
        open (F, "$passCheck") or die;
        @Farr = <F>;
        $pass = $Farr[0];
        chomp $pass;
        if ($password eq $pass){
            print "$username authenticated.\n";
        } else {
            print "Incorrect password!\n";
        }
    } else {
        print "Unknown username!\n";
    }
}elsif ($username && !$password){
    print start_form, "\n";
    print hidden('username', "$username");
    print "Password:\n", textfield('password'), "\n";
    print submit(value => Login), "\n";
    print end_form, "\n";

}elsif ($password && !$username){
    print start_form, "\n";
    print hidden('password', "$password");
    print "Username:\n", textfield('username'), "\n";
    print submit(value => Login), "\n";
    print end_form, "\n";

}else{
    print start_form, "\n";
    print "Username:\n", textfield('username'), "\n";
    print "Password:\n", textfield('password'), "\n";
    print submit(value => Login), "\n";
    print end_form, "\n";
}
print end_html;
exit(0);
