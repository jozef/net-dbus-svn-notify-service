package Net::DBus::SVN::Notify::Service;

=head1 NAME

Net::DBus::SVN::Notify::Service - 

=head1 SYNOPSIS

=head1 DESCRIPTION

=cut

use warnings;
use strict;

our $VERSION = '0.01';

=head1 METHODS

=head2 setup()

=cut

# Invoke the exporter utility and specify the default interface name
use Net::DBus::Exporter 'org.cpan.net.dbus.svn.notify.service';

# Become a D-Bus object
use base 'Net::DBus::Object';

sub setup {
	my $class = shift;
	my %arg   = @_;
	
	# get the bys type either session of default to system
	my $bus_type = $arg{'bus_type'} || q{};
	$bus_type = 'system'
		if (($bus_type ne 'system') and ($bus_type ne 'session'));
	
	# export service name in the bus
	my $service = Net::DBus->$bus_type->export_service('org.cpan.net.dbus.svn.notify.service');

	# register path for the service
	my $self = $class->SUPER::new($service, '/org/cpan/net/dbus/svn/notify/service');
	bless $self, $class;
	
	return $self;
}

# Register a method named “Hello” that takes a string as argument
# and returns a string
dbus_method('Hello', ['string'], ['string']);
sub Hello {
	my $self = shift;
	my ($name) = @_;
	return "Hello $name";
}

1;


__END__

=head1 AUTHOR

Jozef Kutej

=cut
