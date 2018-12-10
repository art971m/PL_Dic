package DIC::Config;

use Config::IniFiles qw();
use File::Spec qw();
use File::HomeDir qw();

use constant {
	CONFIG_FILE => '.dicconf',
	DEFAULT_SEC => 'Global',
	ACCESSORS => [qw(db_user db_password db_conn)],
};

use Class::XSAccessor {
	accessors => [ @{${\ACCESSORS}} ],
};

sub new {
	my $cfg = Config::IniFiles->new(
		-file => File::Spec->catfile(File::HomeDir->my_home(), CONFIG_FILE),
		-default => DEFAULT_SEC,
	);

	return bless {
		map { $_ => $cfg->val(DEFAULT_SEC, $_) } @{${\ACCESSORS}},
	}, __PACKAGE__;
}

1;