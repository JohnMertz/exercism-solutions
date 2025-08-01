package LanguageList;

use v5.38;

our @Languages;

sub add_language ($language) {
	push(@Languages, $language);
}

sub remove_language () {
	pop(@Languages);
}

sub first_language () {
	return($Languages[0]);
}

sub last_language () {
	return($Languages[scalar(@Languages)-1]);
}

sub get_languages (@elements) {
	return map { $Languages[$_-1] } @elements;
}

sub has_language ($language) {
	#return scalar(grep(/^$language$/, @Languages));
	return grep(/^$language$/, @Languages);
}
