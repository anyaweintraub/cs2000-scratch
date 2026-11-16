use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

data BinTree<a>:
  | leaf(val :: a)
  | node(left :: BinTree<a>, right :: BinTree<a>)
end

fun sum-leaves(tree :: BinTree) -> Number:
  doc: "counts the number of leaves in a tree"
  cases (BinTree) tree:
    | leaf(val) => val
    | node(left, right) => sum-leaves(left) + sum-leaves(right)
  end
where:
  sum-leaves(leaf(5)) is 5
  sum-leaves(node(leaf(2), node(leaf(3), leaf(4)))) is 9
end

fun tree-height(tree :: BinTree) -> Number:
  doc: "counts the height (or deepest number of branches) in a tree"
  cases (BinTree) tree:
    |leaf(val) => 0
    |node(left, right) => 1 + num-max(tree-height(left), tree-height(right))
  end
where:
  tree-height(leaf("a")) is 0
  tree-height(node(leaf(1), leaf(2))) is 1
end

fun tree-contains(tree :: BinTree<String>, target :: String) -> Boolean:
  doc: "searches the tree to see if it contains the target string"
  cases (BinTree) tree:
    |leaf(val) => val == target
    |node(left, right) => tree-contains(left, target) or tree-contains(right, target)
  end
  where:
  tree-contains(node(leaf("apple"), leaf("banana")), "banana") is true
  tree-contains(leaf("apple"), "orange") is false
  tree-contains(node(leaf("cat"), node(leaf("dog"), leaf("bird"))), "dog") is true
  end

fun mirror-tree(tree :: BinTree) -> BinTree:
  cases (BinTree) tree:
    | leaf(val) => leaf(val)
    | node(left, right) => node(mirror-tree(right), mirror-tree(left))
  end
where:
  mirror-tree(node(leaf(1), leaf(2))) is node(leaf(2), leaf(1))
  mirror-tree(leaf(5)) is leaf(5)
  mirror-tree(node(leaf(1), node(leaf(2), leaf(3)))) is node(node(leaf(3), leaf(2)), leaf(1))
end