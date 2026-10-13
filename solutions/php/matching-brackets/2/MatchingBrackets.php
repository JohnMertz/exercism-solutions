<?php

declare(strict_types=1);

function brackets_match(string $input): bool
{
    $queue = [];
    foreach (str_split($input) as $l) {
	if ($l == '(' || $l == '{' || $l == '[') array_push($queue, $l);
	if ($l == ')' || $l == '}' || $l == ']') {
	    if (sizeof($queue)) $last = array_pop($queue);
	    else return False;
	    if ($l == ')' && $last != '(') return False;
	    if ($l == '}' && $last != '{') return False;
	    if ($l == ']' && $last != '[') return False;
	}
    }
    if (sizeof($queue)) return False;
    return True;
}
