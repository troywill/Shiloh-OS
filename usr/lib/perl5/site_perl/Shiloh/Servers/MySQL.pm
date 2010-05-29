package MySQL;
use strict;
use warnings;

sub new {
  my $class = shift;
  my $self = {};
  bless($self, $class);
  return $self;
}

sub setup {
  my $self = shift;
  my $GROUPADD_COMMAND = '/usr/sbin/groupadd --gid 40 mysql';
  my $USERADD_COMMAND = '/usr/sbin/useradd --comment "MySQL Server" --home /dev/null --gid mysql --shell /bin/false --uid 40 mysql';

  print "==> $GROUPADD_COMMAND\n";
  sleep 1;
  system $GROUPADD_COMMAND;

  print "==> $USERADD_COMMAND\n";
  sleep 1;
  system $USERADD_COMMAND;
}

return 1;
