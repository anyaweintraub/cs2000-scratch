use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

data River:
  | merge(width :: Number, left :: River, right :: River)
  | stream(flow-rate :: Number)
end

# Example: A small river network
stream-a = stream(5)
stream-b = stream(8)
stream-c = stream(3)
merge-1 = merge(12, stream-a, stream-b)
main-river = merge(15, merge-1, stream-c)

fun total-flow(r :: River) -> Number:
  cases (River) r:
    | merge(width, left, right) => total-flow(left) + total-flow(right)
    | stream(flow) => flow
  end
where:
  total-flow(stream-a) is 5
  total-flow(main-river) is 16
end

fun count-merges(r :: River) -> Number:
  cases (River) r:
    | merge(width, left, right) => 1 + count-merges(left) + count-merges(right)
    | stream(flow) => 0
  end
where:
  count-merges(stream-a) is 0
  count-merges(main-river) is 2
end

fun count-streams(r :: River) -> Number:
  cases (River) r:
    | merge(width, left, right) => count-streams(left) + count-streams(right)
    | stream(flow) => 1
  end
where:
  count-streams(stream-a) is 1
  count-streams(merge-1) is 2
  count-streams(main-river) is 3
end

fun max-width(r :: River) -> Number:
  cases (River) r:
    | merge(width, left, right) => num-max(width, num-max(max-width(left), max-width(right)))
    | stream(flow) => 0
  end
where:
  max-width(stream-a) is 0
  max-width(merge-1) is 12
  max-width(main-river) is 15
end

fun widen-river(r :: River, n :: Number) -> River:
  cases (River) r:
    | merge(width, left, right) => merge(width + n, widen-river(left, n), widen-river(right, n))
    | stream(flow) => stream(flow)
  end
where: 
  widen-river(stream-a, 6) is stream(5)
  widen-river(merge-1, 7) is merge(19, stream-a, stream-b)
end

fun cap-flow(r :: River) -> River:
  cases (River) r:
    | merge(width, left, right) => merge(width, cap-flow(left), cap-flow(right))
    | stream(flow) =>
      if flow > 10:
        stream(10)
      else:
        stream(flow)
      end
  end
where:
  cap-flow(stream-a) is stream(5)
  cap-flow(merge-1) is merge(12, stream(5), stream(8))
end

fun has-large-stream(r :: River) -> Boolean:
  cases (River) r:
    | merge(width, left, right) => has-large-stream(right) or has-large-stream(right)
    | stream(flow) => flow > 6
  end
where:
  has-large-stream(stream-a) is false
  has-large-stream(merge-1) is true
end