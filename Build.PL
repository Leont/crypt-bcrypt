use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
  module_name  => 'Crypt::Bcrypt',
  c_source     => ['src'],
##{ $plugin->get_prereqs ##}
);

$builder->create_build_script();

