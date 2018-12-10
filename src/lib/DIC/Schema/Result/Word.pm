package DIC::Schema::Result::Word;
use base qw/DBIx::Class::Core/;
 
__PACKAGE__->table('Word');
__PACKAGE__->add_columns(qw/ artistid name /);
__PACKAGE__->set_primary_key('artistid');
 
1;