use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun my-doubles(nums :: List<Number>) -> List<Number> block:
  var result = [list: ]
  for each(n from nums):
    result := result + [list: n * 2]
  end
  result
where:
  my-doubles([list: 1, 2, 3]) is [list: 2, 4, 6]
  my-doubles([list: ]) is [list: ]
end

fun my-doubles-map(nums :: List<Number>) -> List<Number> block:
  nums.map(lam(n): n * 2 end)
where:
  my-doubles-map([list: 1, 2, 3]) is [list: 2, 4, 6]
  my-doubles-map([list: ]) is [list: ]
end

fun my-string-lens(strings :: List<String>) -> List<Number> block:
  var result = [list: ]
  for each(s from strings):
    result := result + [list: string-length(s)]
  end
  result
where:
  my-string-lens([list: "cat", "hello", "a"]) is [list: 3, 5, 1]
  my-string-lens([list: ]) is [list: ]
end

fun my-string-lens-map(strings :: List<String>) -> List<Number> block:
  strings.map(string-length)
where:
  my-string-lens-map([list: "cat", "hello", "a"]) is [list: 3, 5, 1]
  my-string-lens-map([list: ]) is [list: ]
end

fun my-pos-nums(nums :: List<Number>) -> List<Number> block:
  var result = [list: ]
  for each(n from nums):
    when n > 0:
      result := result + [list: n]
    end
  end
  result
where:
  my-pos-nums([list: -3, 5, 0, 2, -1]) is [list: 5, 2]
  my-pos-nums([list: -1, -2]) is [list: ]
end

fun my-pos-nums-filter(nums :: List<Number>) -> List<Number> block:
  nums.filter(lam(n): n > 0 end)
where:
  my-pos-nums-filter([list: -3, 5, 0, 2, -1]) is [list: 5, 2]
  my-pos-nums-filter([list: -1, -2]) is [list: ]
end

fun my-alternating(lst :: List) -> List block:
  var result = [list: ]
  var keep = true
  for each(elt from lst):
      block:
        result := 
      if keep: result + [list: elt] 
      else: result end
        keep := not(keep)
      end
    end
    result
where:
  my-alternating([list: 1, 2, 3, 4, 5]) is [list: 1, 3, 5]
  my-alternating([list: "a", "b", "c", "d"]) is [list: "a", "c"]
end

#Cannot use map or filter because map tracks each element independently and filter only checks values.

fun my-running-sum(nums :: List<Number>) -> List<Number>
  block:
    var current-sum = 0
    var result = [list: ]
    for each(n from nums):
     block:
      current-sum := current-sum + n
      result := result + [list: current-sum]
    end
  end
    result
where:
  my-running-sum([list: 1, 2, 3]) is [list: 1, 3, 6]
  my-running-sum([list: 10, -2, 5]) is [list: 10, 8, 13]
end

#Cannot use map or filter because map tracks each element independently and filter only checks values.