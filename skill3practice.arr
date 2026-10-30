use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")


fun list-of-squares(numbers :: List<Number>) -> List<Number> block:
  doc: "produce the squares of the numbers in the input"

  var result = [list: ]
  
  for each(n from numbers):
    result := result + [list: n * n]
  end
  
  result
where:
  list-of-squares([list: ]) is [list: ]
  list-of-squares([list: 5, 6]) is [list: 25, 36]
  list-of-squares([list: -1, 0, 1]) is [list: 1, 0, 1]
end

fun has-positive(numbers :: List<Number>) -> Boolean block:
  doc: "takes a list of numbers and returns true if at least one is positive"
  
  var is-positive = false
  
  for each(n from numbers):
    if n > 0:
      is-positive := true
    else:
      is-positive
    end
  end
  
  is-positive
  
where:
  has-positive([list: ]) is false
  has-positive([list: 2, -6]) is true
  has-positive([list: -4, 0]) is false
end

fun all-increasing(numbers :: List<Number>) -> Boolean block:
  doc: "takes a list of numbers and returns true if each number is greater than the previous"
  
  var increasing = true
  var previous = 0
  var has-previous = false
  
  for each(n from numbers):
    if has-previous:
      if n <= previous:
        increasing := false
      else:
        previous := n
      end
    else: block:
      previous := n
      has-previous := true
    end
  end
  end
  increasing
  
where:
  all-increasing([list: ]) is true
  all-increasing([list: 2, -6, -4]) is false
  all-increasing([list: -4, 0]) is true
end

fun double-all(numbers :: List<Number>) -> List<Number> block:
  doc: "takes a list and returns a list where each element is doubled"
  
  var result = [list: ]
  
  for each(n from numbers):
    result := result + [list: 2 * n]
  end
  
    result

where:
  double-all([list: ]) is [list: ]
  double-all([list: 2, 6, 7, -9]) is [list: 4, 12, 14, -18]
  double-all([list: -3, 0, 0]) is [list: -6, 0, 0]
end

fun keep-positives(numbers :: List<Number>) -> List<Number> block:
  doc: "takes a list of numbers and returns a list of only the positive numbers"
  
  var positive-list = [list: ]
  
  for each(n from numbers):
    if n > 0:
      positive-list := positive-list + [list: n]
    else:
      positive-list
    end
  end
  positive-list
where:
  keep-positives([list: ]) is [list: ]
  keep-positives([list: 2, 6, 7, -9]) is [list: 2, 6, 7]
  keep-positives([list: -3, 0, 0]) is [list: ]
end   

fun all-even(numbers :: List<Number>) -> Boolean block:
  doc: "returns true if every number in a list is even"
  
  var is-even = true
  
  for each(n from numbers):
    if num-modulo(n, 2) == 0:
      is-even
    else:
      is-even := false
    end
  end
  
  is-even
  
where:
  all-even([list: ]) is true
  all-even([list: 2, 6, 7, 8]) is false
  all-even([list: 2, 5, 6, 9]) is false
end

fun add-exclamation(strings :: List<String>) -> List<String> block:
  doc: "takes a list of strings and returns a new list where each string has an exclamation mark"
  
  var result = [list: ]
  
  for each(s from strings):
    result := result + [list: string-append(s, "!")]
  end
  
  result
  
where:
  add-exclamation([list: "hello", "mom"]) is [list: "hello!", "mom!"]
end

fun count-long-strings(strings :: List<String>, min-length :: Number) -> Number block:
  doc: "takes a list of strings and returns the number of strings whose length is longer than min-length"
  
  var total = 0
  
  for each(s from strings):
    if string-length(s) > min-length: 
      total := total + 1
    else:
      total
    end
  end
  
  total
  
where: 
  count-long-strings([list: "hello", "mom"], 3) is 1
end



  