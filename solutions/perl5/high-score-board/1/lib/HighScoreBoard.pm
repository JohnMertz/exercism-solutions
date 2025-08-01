package HighScoreBoard;

use v5.38;

our %Scores;

sub set_player_scores (%new_scores) {
	$Scores{$_} = $new_scores{$_} foreach (keys(%new_scores));
}

sub get_player_score ($player) {
	return $Scores{$player};
}

sub increase_player_scores (%additional_scores) {
	$Scores{$_} += $additional_scores{$_} foreach (keys(%additional_scores));
}

sub sort_players_by_name {
	return sort(keys(%Scores));
}

sub sort_players_by_score {
	return sort { $Scores{$b} <=> $Scores{$a} } keys(%Scores);
}

sub delete_player ($player) {
	delete($Scores{$player});
}
