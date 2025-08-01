use v5.40;
use experimental qw<class>;

class BinarySearchTree;
field $root :param :reader;

method add($i) {
    $root->add($i);
}

method sort() {
    return $root->sort();
}

class BinarySearchTree::Node;

field $data :param :reader;
field $left :reader = undef;
field $right :reader = undef;

method sort() {
    return [
        (defined($left) ? @{$left->sort()} : ()), 
        $data,
        (defined($right) ? @{$right->sort()} : ())
    ];
}

method add($i) {
    if ($i < $data) {
        if (defined($left)) {
            $left->add($i);
        } else {
            $left = new('BinarySearchTree::Node', 'data' => $i);
        }
    } else {
        if (defined($right)) {
            $right->add($i);
        } else {
            $right = new('BinarySearchTree::Node', 'data' => $i);
        }
    }
};

1;
