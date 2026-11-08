<?php

declare(strict_types=1);

class ProteinTranslation
{
  public $codons = [
    'AUG' => 'Methionine',
    'UUU'=> 'Phenylalanine', 'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine', 'UUG' => 'Leucine',
    'UCU' => 'Serine', 'UCC' => 'Serine', 'UCA' => 'Serine', 'UCG' => 'Serine',
    'UAU' => 'Tyrosine', 'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine', 'UGC' => 'Cysteine',
    'UGG' => 'Tryptophan'
  ];

  public function getProteins(string $text): array
  {
    $out = [];
    while (strlen($text)) {
      $c = substr($text, 0, 3);
      if (preg_match('/U(A[AG]|GA)/', $c)) break;
      if (!isset($this->codons[$c])) throw new InvalidArgumentException("Invalid codon");
      array_push($out, $this->codons[$c]);
      $text = substr($text, 3);
    }
    return $out;
  }
}
