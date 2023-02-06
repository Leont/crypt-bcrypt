use warnings;
use strict;

use Test::More;

use Crypt::Bcrypt qw/bcrypt bcrypt_check bcrypt_hashed bcrypt_check_hashed/;

my $password = "Hello World,";
my $salt = "A" x 16;

my $hash1 = bcrypt($password, "2b", 12, $salt);

ok($hash1);
ok(bcrypt_check($password, $hash1));

my $hash2 = bcrypt_hashed($password, "2b", 14, $salt, 'sha256');
like($hash2, qr/ ^ \$ bcrypt-sha256 \$ v=2,t=(2\w),r=(\d{2}) \$ /x, 'Prehashed bcrypt hash');
ok(bcrypt_check_hashed($password, $hash2), 'Hashed password validates');

done_testing;
