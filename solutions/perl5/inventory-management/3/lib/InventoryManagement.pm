package InventoryManagement;

use v5.40;

sub create_inventory ($items) {
    my %inventory;
    return { map { $_ => ++$inventory{$_} } @$items };
}

sub add_items ( $inventory, $items ) {
    $inventory->{$_}++ foreach (@$items);
    return $inventory;
}

sub remove_items ( $inventory, $items ) {
    foreach (@$items) {
        $inventory->{$_}-- if ($inventory->{$_});
    }
    return $inventory;
}

sub delete_item ( $inventory, $item ) {
    delete($inventory->{$item});
    return $inventory;
}

1;
