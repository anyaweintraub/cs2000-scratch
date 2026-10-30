use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

data BST:
  | empty-leaf
  | node(key :: Number, val :: String, left :: BST, right :: BST)
end
# Invariant: keys are unique, and all nodes in the left
# subtree have keys less than the key in the current node,
# all nodes in the right subtree have keys greater than
# the key in the current node

BST0 = empty-leaf
BST1 = node(1, "hello", BST0, BST0)
BST2 = node(5, "bye", BST1, BST0)
BST3 = node(6, "bye", BST2, node(10, "cs2000", BST0, BST0))

#|
fun bst-temp(bst :: BST) -> ???:
  cases (BST) bst:
    | empty-leaf => ...
    | node(k, v, left, right) => 
        ... k ...
        ... v ...
        ... bst-temp(left) ...
        ... bst-temp(right) ...
  end
end
|#

fun height(bst :: BST) -> Number:
  cases (BST) bst:
    | empty-leaf => 0
    | node(k, v, left, right) => 
        1 + num-max(height(left), height(right))
  end
where:
  height(BST0) is 0
  height(BST1) is 1
  height(BST2) is 2
  height(BST3) is 3
end

fun retrieve(bst :: BST, target :: Number) -> Option<String>:
  cases (BST) bst:
    | empty-leaf => none
    | node(k, v, left, right) =>
      if target == k:
        some(v)
      else if target < k:
        retrieve(left, target)
      else: 
        retrieve(right, target)
      end
  end
where:
  retrieve(BST0, 1) is none
  retrieve(BST1, 1) is some("hello")
  retrieve(BST2, 5) is some("bye")
  retrieve(BST2, 1) is some("hello")
  retrieve(BST2, 99) is none
  retrieve(BST3, 10) is some("cs2000")
end

fun is-balanced(bst :: BST) -> Boolean:
  cases (BST) bst:
    | empty-leaf => true
    | node(k, v, left, right) =>
      (num-abs(height(left) - height(right)) <= 1) and
      is-balanced(left) and
      is-balanced(right)
  end
where:
  is-balanced(BST0) is true
  is-balanced(BST1) is true
  is-balanced(BST2) is true
  is-balanced(BST3) is true
end

data Arith:
  | num-lit(n :: Number)
  | add(left :: Arith, right :: Arith)
  | sub(left :: Arith, right :: Arith)
  | mul(left :: Arith, right :: Arith)
  | div(left :: Arith, right :: Arith)
end

expression1 = add(num-lit(1), num-lit(2))
expression2 = mul(num-lit(1), div(num-lit(3), num-lit(4)))
expression3 = mul(sub(num-lit(7), num-lit(3)), add(num-lit(2), div(num-lit(5), num-lit(2))))

fun eval(expression :: Arith) -> Number:
  cases (Arith) expression:
    | num-lit(n) => n
    | add(l, r) => eval(l) + eval(r)
    | sub(l, r) => eval(l) - eval(r)
    | mul(l, r) => eval(l) * eval(r)
    | div(l, r) => eval(l) / eval(r)
  end
where:
  eval(expression1) is 3
  eval(expression2) is 0.75
  eval(expression3) is 18
end