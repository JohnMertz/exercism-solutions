<?php

declare(strict_types=1);

class MicroBlog
{
    public function truncate(string $text): string
    {
        if (mb_strlen($text) > 5) {
            $text = mb_substr($text, 0, 5);
        }
        return $text;
    }
}
