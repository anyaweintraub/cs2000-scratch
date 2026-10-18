use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

var score = 10

fun bonus-points(amt :: Number) -> Number block:
  score := score + amt
  penalty-check()
end
fun penalty-check() -> Number block:
  when score > 15:
    score := score - 3
  end
  score
end

bonus-points(2)
bonus-points(4) 
bonus-points(1)

# 12, 13, 14

var dta = [list: 1, 2, 3]
var position = 0
fun advance() -> Number block:
  result = dta.get(position)
  position := position + 1
  when position >= length(dta) block:
    position := 0
    dta := [list: 0] + dta
  end
  result
end
fun process-data() -> Number block:
  first = advance()
  second = advance()
  first + second
end

process-data()
process-data()
process-data()

# 3

var multiplier = 1
var base = 5
fun update-multiplier(n :: Number) -> Number block:
  multiplier := multiplier + n
  when num-modulo(multiplier, 3) == 0 block:
    base := base - 1
    multiplier := 1
  end
  multiplier
end

fun calculate(x :: Number) -> Number block:
  update-multiplier(x)
  (x * multiplier) + base
end

calculate(2)
calculate(1)
calculate(4)
calculate(2)

# 6 (m1, b4), 6 (m2, b4), 7 (m1, b3), 4 (m1, b2)

# where blocks fail because based on same input always yielding same output

