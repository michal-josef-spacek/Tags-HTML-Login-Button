package Tags::HTML::Login::Button;

use base qw(Tags::HTML);
use strict;
use warnings;

use Class::Utils qw(set_params split_params);
use Error::Pure qw(err);

our $VERSION = 0.01;

# Constructor.
sub new {
	my ($class, @params) = @_;

	# Create object.
	my ($object_params_ar, $other_params_ar) = split_params(
		['link', 'title'], @params);
	my $self = $class->SUPER::new(@{$other_params_ar});

	# Login button link.
	$self->{'link'} = 'login';

	# Login button title.
	$self->{'title'} = 'LOGIN';

	# Process params.
	set_params($self, @{$object_params_ar});

	# Object.
	return $self;
}

# Process 'Tags'.
sub _process {
	my $self = shift;

	# Main content.
	$self->{'tags'}->put(
		['a', 'class', 'outer'],

		['b', 'div'],
		['a', 'class', 'login'],
		['b', 'a'],
		['a', 'href', $self->{'link'}],
		['d', $self->{'title'}],
		['e', 'a'],
		['e', 'div'],
	);

	return;
}

# Process 'CSS::Struct'.
sub _process_css {
	my $self = shift;

	$self->{'css'}->put(
		['s', '.outer'],
		['d', 'position', 'fixed'],
		['d', 'top', '50%'],
		['d', 'left', '50%'],
		['d', 'transform', 'translate(-50%, -50%)'],
		['e'],

		['s', '.login'],
		['d', 'text-align', 'center'],
		['d', 'background-color', 'blue'],
		['d', 'padding', '1em'],
		['e'],

		['s', '.login a'],
		['d', 'text-decoration', 'none'],
		['d', 'color', 'white'],
		['d', 'font-size', '3em'],
		['e'],
	);

	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Tags::HTML::Login::Button - Tags helper for login button.

=head1 SYNOPSIS

 use Tags::HTML::Login::Button;

 my $obj = Tags::HTML::Login::Button->new(%params);
 $obj->process;
 $obj->process_css;

=head1 METHODS

=head2 C<new>

 my $obj = Tags::HTML::Login::Button->new(%params);

Constructor.

Returns instance of object.

=over 8

=item * C<css>

'CSS::Struct::Output' object for L<process_css> processing.

Default value is undef.

=item * C<link>

Login button link.

Default value is 'login'.

=item * C<tags>

'Tags::Output' object.

Default value is undef.

=item * C<title>

Login button title.

Default value is 'LOGIN'.

=back

=head2 C<process>

 $obj->process($percent_value);

Process Tags structure for gradient.

Returns undef.

=head2 C<process_css>

 $obj->process_css;

Process CSS::Struct structure for output.

Returns undef.

=head1 ERRORS

 new():
         From Class::Utils::set_params():
                 Unknown parameter '%s'.
         Parameter 'css' must be a 'CSS::Struct::Output::*' class.
         Parameter 'tags' must be a 'Tags::Output::*' class.

 process():
         From Tags::HTML::process():
                 Parameter 'tags' isn't defined.

 process_css():
         From Tags::HTML::process_css():
                 Parameter 'css' isn't defined.

=head1 EXAMPLE

 use strict;
 use warnings;

 use CSS::Struct::Output::Indent;
 use Tags::HTML::Login::Button;
 use Tags::Output::Indent;

 # Object.
 my $css = CSS::Struct::Output::Indent->new;
 my $tags = Tags::Output::Indent->new;
 my $obj = Tags::HTML::Login::Button->new(
         'css' => $css,
         'tags' => $tags,
 );

 # Process indicator.
 $obj->process_css;
 $obj->process;

 # Print out.
 print "CSS\n";
 print $css->flush."\n";
 print "HTML\n";
 print $tags->flush."\n";

 # Output:
 # TODO

=head1 DEPENDENCIES

L<Class::Utils>,
L<Error::Pure>,
L<Tags::HTML>.

=head1 SEE ALSO

=over

=item L<Tags::HTML::Stars>

Tags helper for stars evaluation.

=back

=head1 REPOSITORY

L<https://github.com/michal-josef-spacek/Tags-HTML-Login-Button>

=head1 AUTHOR

Michal Josef Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

© Michal Josef Špaček 2021

BSD 2-Clause License

=head1 VERSION

0.01

=cut
