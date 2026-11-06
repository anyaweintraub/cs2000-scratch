use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


fun make-positive(lon :: List<Number>) -> List<Number>:
  doc: "take the absolute value of each number in the list"
  
  cases (List) lon:
    | empty => empty
    | link(first, rest) =>
      if first > 0:
        link(first, make-positive(rest))
      else:
        link(0 - first, make-positive(rest))
      end        
  end
where:
  make-positive([list: ]) is [list: ]
  make-positive([list: -1, 0, 2]) is [list: 1, 0, 2]
end

fun count-warm(lon :: List<Number>) -> Number:
  doc: "takes a list of numbers and returns a count of numbers greater than 70"
  cases (List) lon:
    |empty => 0
    |link(first, rest) => 
      if first > 70:
        1 + count-warm(rest)
      else:
        count-warm(rest)
      end
  end
where:
  count-warm([list: 85, 72, 90]) is 3
  count-warm([list: ]) is 0
  count-warm([list: 64, 90, 32]) is 1
end

fun build-string(los :: List<String>) -> String:
  doc: "takes a list of strings and returns a large string in order"
  cases (List) los:
    |empty => ""
    |link(first, rest) => string-append((first), build-string(rest))
  end
where:
  build-string([list: "a", "b", "C"]) is "abC"
  build-string([list: "12", "35"]) is "1235"
end

fun remove-negatives(lon :: List<Number>) -> List<Number>:
  doc: "removes negatives from a number list"
  cases (List) lon:
    |empty => [list: ]
    |link(first, rest) =>
      if first < 0:
        remove-negatives(rest)
      else:
        [list: first] + remove-negatives(rest)
      end
  end
where:
  remove-negatives([list: -3, 4, -6, 2, 0]) is [list: 4, 2, 0]
end

fun double-all(lon :: List<Number>) -> List<Number>:
  doc: "returns a list of doubled numbers"
  cases (List) lon:
    |empty => [list: ]
    |link(first, rest) => [list: (first * 2)] + double-all(rest)
  end
where:
  double-all([list: 2, 5, -1]) is [list: 4, 10, -2]
end

fun count-trues(lob :: List<Boolean>) -> Number:
  doc: "counts the numbers of trues in a list of booleans"
  cases (List) lob:
    |empty => 0
    |link(first, rest) => 
      if first == true:
        1 + count-trues(rest)
      else:
        count-trues(rest)
      end
  end
where:
  count-trues([list: true, false, true, false]) is 2
end

fun string-lengths(los :: List<String>) -> List<Number>:
  doc: "takes a list of strings and returns the length of each string in a list"
  cases (List) los:
    |empty => [list: ]
    |link(first, rest) => [list: string-length(first)] + string-lengths(rest)
  end
where:
  string-lengths([list: "ab", "cdef", ""]) is [list: 2, 4, 0]
end

fun all-positive(lon :: List<Number>) -> Boolean:
  doc: "takes a list of numbers and returns true if they are all positive"
  cases (List) lon:
    |empty => true
    |link(first, rest) =>
      if first > 0:
        all-positive(rest)
      else:
        false
      end
  end
where:
  all-positive([list: 3, -1, 2]) is false
  all-positive([list: 2, 4]) is true
end

fun keep-evens(lon :: List<Number>) -> List<Number>:
  doc: "only keeps even in a list of number"
  cases (List) lon:
    |empty => [list: ]
    |link(first, rest) =>
      if num-modulo(first, 2) == 0:
        [list: first] + keep-evens(rest)
      else:
        keep-evens(rest)
      end
  end
where:
  keep-evens([list: 2, 4, 7, 8]) is [list: 2, 4, 8]
end

fun sum-odds(lon :: List<Number>) -> Number:
  doc: "sums all odd numbers"
  cases (List) lon:
    |empty => 0
    |link(first, rest) =>
      if num-modulo(first, 2) == 1:
        first + sum-odds(rest)
      else:
        sum-odds(rest)
      end
  end
where:
  sum-odds([list: 2, 6, 5, 7, 2, 1]) is 13
end
        