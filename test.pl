# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..5\n"; }
END {print "not ok 1\n" unless $loaded;}
use OS2::WinObject;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

$test = 1;

use OS2::WinObject ':all';

$test++;
$x = QueryObject('<WP_DESKTOP>') or print "# \$!=$!\nnot ";
print "ok $test\n";

$test++;
OpenObject($x,OPEN_SETTINGS,1) or print "# \$!=$!\nnot ";
print "ok $test\n";

$test++;
$buf = ' ' x 500;
QueryObjectPath($x,$buf,length($buf)) or print "# \$!=$!\nnot ";
print "ok $test\n";

$test++;
$buf =~ s/\0.*//s or print "# \$!=$!\nnot ";
print "ok $test\n";

print "# path to desktop is '$buf'\n";

