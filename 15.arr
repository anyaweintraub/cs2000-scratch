use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun my-sum(num-list :: List<Number>) -> Number block:
  var total = 0
  for each(n from num-list):
    total := total + n
  end
  total
where:
  my-sum([list: 0, 1, 2, 3]) is 6
end

fun my-product(num-list :: List<Number>) -> Number block:
  var total = 1
  for each(n from num-list):
    total := total * n
  end
  total
where:
  my-product([list: 2, 3, 4]) is 24
end

fun sum-even-numbers(num-list :: List<Number>) -> Number block:
    var total = 0
    for each(n from num-list):
      when num-modulo(n, 2) == 0:
        total := total + n
      end
    end
    total
  where:
    sum-even-numbers([list: 1, 2, 3, 4, 5, 6]) is 12
    sum-even-numbers([list: 1, 3, 5]) is 0
end

fun my-length(lst :: List<Any>) -> Number block:
  var total = 0
  for each(item from lst):
    total := total + 1
  end
  total
where:
    my-length([list: "apple", "banana", "cherry"]) is 3
    my-length([list: ]) is 0
end

fun any-negative(num-list :: List<Number>) -> Boolean block:
  var found = false
  for each(n from num-list):
    when n < 0:
      found := true
    end
  end
  found
where:
    any-negative([list: 4, 2, -1, 5]) is true
    any-negative([list: 4, 2, 1, 5]) is false
end

fun all-short-words(word-list :: List<String>) -> Boolean block:
  var all-short = true
  for each(word from word-list):
    when string-length(word) > 4:
      all-short := false
    end
  end
  all-short
where:
    all-short-words([list: "cat", "dog", "bird"]) is true
    all-short-words([list: "hello", "cat"]) is false
end

fun reverse-list(lst :: List<Any>) -> List<Any> block:
  var result = [list: ]
  for each(item from lst):
    result := link(item, result)
  end
  result
where:
    reverse-list([list: 1, 2, 3]) is [list: 3, 2, 1]
    reverse-list([list: ]) is [list: ]
end

fun concat-all(string-list :: List<String>) -> String block:
  var result = ""
  for each(s from string-list):
    result := result + s
  end
  result
where:
    concat-all([list: "pyret", " ", "is", " ", "fun"]) is "pyret is fun"
    concat-all([list: ]) is ""
end