use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Tags::HTML::Login::Button;
use Tags::Output::Structure;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Test.
my $tags = Tags::Output::Structure->new;
my $obj = Tags::HTML::Login::Button->new(
	'tags' => $tags,
);
$obj->process;
my $ret_ar = $tags->flush(1);
is_deeply(
	$ret_ar,
	[
		['a', 'class', 'outer'],

		['b', 'div'],
		['a', 'class', 'login'],
		['b', 'a'],
		['a', 'href', 'login'],
		['d', 'LOGIN'],
		['e', 'a'],
		['e', 'div'],
	],
	'Default login button.',
);

# Test.
$obj = Tags::HTML::Login::Button->new(
	'link' => 'https://example.com/login',
	'tags' => $tags,
	'title' => 'Button login',
);
$obj->process;
$ret_ar = $tags->flush(1);
is_deeply(
	$ret_ar,
	[
		['a', 'class', 'outer'],

		['b', 'div'],
		['a', 'class', 'login'],
		['b', 'a'],
		['a', 'href', 'https://example.com/login'],
		['d', 'Button login'],
		['e', 'a'],
		['e', 'div'],
	],
	'Login button with explicit link a title.',
);

# Test.
$obj = Tags::HTML::Login::Button->new;
eval {
	$obj->process;
};
is($EVAL_ERROR, "Parameter 'tags' isn't defined.\n",
	"Parameter 'tags' isn't defined.");
clean();
