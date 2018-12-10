#!/usr/bin/env perl

use strict;
use warnings;
use FindBin qw($Bin);
use DBIx::Class qw();
use Data::Dumper;

use lib "$Bin/../lib";
use DIC::Config qw();
use DIC::Schema qw();


my $config = DIC::Config->new();
print Dumper $config;

my $schema = DIC::Schema->connect(
	$config->db_conn(), 
	$config->db_user(), 
	$config->db_password(),
);
$schema->storage()->ensure_connected();