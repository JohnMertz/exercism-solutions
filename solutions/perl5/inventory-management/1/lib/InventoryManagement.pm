package InventoryManagement;

use v5.38;

sub create_inventory ($items) {
    my %inventory;
    return { map { $_ => ++$inventory{$_} || 1 } @$items };
}

sub add_items ( $inventory, $items ) {
    $inventory->{$_}++ foreach (@$items);
    return $inventory;
}

sub remove_items ( $inventory, $items ) {
    foreach (@$items) {
    	$inventory->{$_}-- unless ($inventory->{$_} == 0);
    }
    return $inventory;
}

sub delete_item ( $inventory, $item ) {
    delete($inventory->{$item});
    return $inventory;
}
