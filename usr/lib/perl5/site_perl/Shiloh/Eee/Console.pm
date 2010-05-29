package Console;
use strict;
sub new {
  my $class = shift;
  my $self = {};
  $self->{FONT} = "Lat2-Terminus16";
  bless($self, $class);
  return $self;
}

sub set {
  my $self = shift;
  if (@_) { $self->{FONT} = shift }
  my $font = $self->{FONT};
  my $font_path = '/lib/kbd/consolefonts/' . $font . 'psfu.gz';
  `setfont $font`;
  return $self->{FONT};
};

return 1;
