<?php

declare(strict_types=1);

function twoFer(string $name = null): string
{
    return "One for ".($name ? $name : 'you').", one for me.";
}
