use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun add-till-zero(l :: List<Number>) -> Number:
  cases (List) l:
    | empty      => 0 
    | link(f, r) => 
      if f == 0:
        0
      else:
        f + add-till-zero(r)
      end
    end
where:
  add-till-zero([list: 7, 3, 0, 5]) is 
    [list: 7, 3, 0, 5].first + add-till-zero([list: 7, 3, 0, 5].rest)
  add-till-zero([list:    3, 0, 5]) is     
    [list: 3, 0, 5].first + add-till-zero([list: 3, 0, 5].rest)
  add-till-zero([list:       0, 5]) is 0
  add-till-zero([list:])            is 0
end

fun add-till-zero2(l :: List<Number>) -> Number block:
  var total = 0
  var keep-going = true
  for each(n from l):
    when keep-going:
      if n == 0:
        keep-going := false
      else:
        total := total + n
      end
    end
  end
  total
end

LEN-LIMIT = 5

fun strings-less-than(l :: List<String>) -> List<String>:
  cases (List) l:
    | empty => empty
    | link(f, r) =>
      if string-length(f) < LEN-LIMIT:
        link(f, strings-less-than(r))
      else:
        strings-less-than(r)
      end
  end
where:
  strings-less-than([list: "cat", "elephant", "dog", "hi"])
    is [list: "cat", "dog", "hi"]
  strings-less-than([list: "elephant", "giraffe"])
    is empty
end

fun strings-less-than-for-each(l :: List<String>) -> List<String> block:
  var result = [list: ]
  for each(s from l):
    if string-length(s) < LEN-LIMIT:
      result := result + [list: s]
    else:
      nothing
    end
  end
  result
where:
  strings-less-than-for-each([list: "cat", "elephant", "dog", "hi"])
    is [list: "cat", "dog", "hi"]
  strings-less-than-for-each([list: "elephant", "giraffe"])
    is empty
end

fun find-error-suffix(l :: List<String>) -> List<String>:
  cases (List) l:
    | empty => empty
    | link(f, r) =>
      if f == "error":
        l
      else:
        find-error-suffix(r)
      end
  end
where:
  find-error-suffix([list: "ok", "hello", "error", "failed", "done"])
    is [list: "error", "failed", "done"]
  find-error-suffix([list: "hello", "world"])
    is empty
  find-error-suffix([list: "error", "done"])
    is [list: "error", "done"]
end

fun find-error-suffix-for-each(l :: List<String>) -> List<String> block:
  var result = [list: ]
  var found = false
  for each(s from l):
    block:
      if found:
        result := result + [list: s]
      else:
        if s == "error" block:
          found := true
          result := result + [list: s]
        else:
          result := result
        end
      end
    end
  end
  result
where:
  find-error-suffix-for-each([list: "ok", "hello", "error", "failed", "done"])
    is [list: "error", "failed", "done"]
  find-error-suffix-for-each([list: "hello", "world"])
    is [list: ]
  find-error-suffix-for-each([list: "error", "done"])
    is [list: "error", "done"]
end