<?php

function language_list(...$items): array
{
    return $items;
}

function add_to_language_list($list, $lang): array
{
    return [ ...$list, $lang ];
}

function prune_language_list($list): array
{
    return array_slice($list, 1);
}

function current_language($list): string
{
    return $list[0];
}

function language_list_length($list): int
{
    return sizeof($list);
}
