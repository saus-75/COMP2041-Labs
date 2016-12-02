#!/usr/bin/perl -w

use CGI qw/:all/;
use CGI::Carp qw(fatalsToBrowser warningsToBrowser);

# Simple CGI script written by andrewt@cse.unsw.edu.au
# Outputs a form which will rerun the script
# An input field of type hidden is used to pass an integer
# to successive invocations

print <<eof;
Content-Type: text/html

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Play Guessing Number</title>
</head>
<body>
eof

warningsToBrowser(1);

$guess = param("guess")||50;
$low_limit = param('low_limit')||1;
$high_limit = param('high_limit')||100;

if (defined param("correct")){
    print <<eof;
        <form method="post" action="">
            "I win!!!"
            <input type="submit" name="play_again" value="Play Again?">
        </form>
eof
} else {
    if (defined param("higher")){
        $low_limit = $guess;
        $guess = int(($low_limit + $high_limit)/2);
    } elsif (defined param("lower")){
        $high_limit = $guess;
        $guess = int(($low_limit + $high_limit)/2);
    }
    print <<eof;
        <form method="post" action="">
            "My guess is $guess"
            <input type=hidden name="guess" value="$guess">
            <input type=hidden name="low_limit" value="$low_limit">
            <input type=hidden name="high_limit" value="$high_limit">
            <input type="submit" name="lower" value="Lower?">
            <input type="submit" name="correct" value="Correct?">
            <input type="submit" name="higher" value="Higher?">
        </form>
eof
}
print <<eof;
</form>
</body>
</html>
eof
exit(0);
