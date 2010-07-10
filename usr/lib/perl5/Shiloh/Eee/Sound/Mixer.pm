package Mixer;
use strict;
sub new {
  my $class = shift;
  my $self = {};
  $self->{CHIP} = "Realtek";
  $self->{VOLUME} = undef;
  bless($self, $class);
  return $self;
}

sub volume {
  my $self = shift;
  if (@_) { $self->{VOLUME} = shift }
  my $volume = $self->{VOLUME};
  $volume = $volume . '%';
  print "DEBUG: VOLUME is $volume\n";
  system("amixer -c1 set Speaker $volume 1>/dev/null");
  $self->unmute();
  return $self->{VOLUME};
};

sub volume_usb {
  my $self = shift;
  if (@_) { $self->{VOLUME} = shift }
  my $volume = $self->{VOLUME};
  $volume = $volume . '%';
  system("amixer -c2 set Speaker $volume 1>/dev/null");
  $self->unmute();
  return $self->{VOLUME};
};

sub volume_speaker {
  my $self = shift;
  if (@_) { $self->{VOLUME} = shift }
  my $volume = $self->{VOLUME};
  $volume = $volume . '%';
  system("amixer -c0 set Speaker $volume 1>/dev/null");
  $self->unmute();
  return $self->{VOLUME};
};

sub chip {
  my $self = shift;
  if (@_) { $self->{CHIP} = shift }
  return $self->{CHIP};
}

sub mute {
  system("amixer set Master mute 1>/dev/null");
}

sub unmute {
  system("amixer set Master unmute 1>/dev/null");
}

return 1;
