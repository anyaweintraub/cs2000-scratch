use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
include csv 

items = table: item :: String, x-coordinate :: Number, y-coordinate :: Number
    row: "Sword of Dawn",           23,  -87
    row: "Healing Potion",         -45,   12
    row: "Dragon Shield",           78,  -56
    row: "Magic Staff",             -9,   64
    row: "Elixir of Strength",      51,  -33
    row: "Cloak of Invisibility",  -66,    5
    row: "Ring of Fire",            38,  -92
    row: "Boots of Swiftness",     -17,   49
    row: "Amulet of Protection",    82,  -74
    row: "Orb of Wisdom",          -29,  -21
  end

fun calc-distance(r :: Row) -> Number:
  doc: "does distance to origin from fields 'x-coordinate' and 'y-coordinate'"
  num-sqrt(num-sqr(get-column(r, "x-coordinate")) + num-sqr(get-column(r, "y-coordinate")))
where:
  calc-distance(get-row(items, 0)) is-roughly num-sqrt(num-sqr(23) + num-sqr(-87))
  calc-distance(get-row(items, 3)) is-roughly num-sqrt(num-sqr(-9) + num-sqr(64))
end

items-with-dist = build-column(items, "distance", calc-distance)

fun subtract-1(n :: Number) -> Number:
  doc: "subtracts 1 from input"
  n - 1
where:
  subtract-1(10) is 9
  subtract-1(0) is -1
  subtract-1(-3.5) is -4.5
end

moved-items = transform-column(items, "x-coordinate", subtract-1)

fun percent-10-less(n :: Number) -> Number:
  doc: "scales input down by 10%"
  n * 0.1
where:
  percent-10-less(10) is 1
  percent-10-less(0) is 0
  percent-10-less(-3.5) is -0.35
end

scaled-items = (transform-column(transform-column(items, "x-coordinate", percent-10-less), "y-coordinate", percent-10-less))

scaled-items-with-dist = build-column(scaled-items, "distance", calc-distance)

rn-version = transform-column(scaled-items-with-dist, "distance", num-to-rational)

ordered-siwd = order-by(rn-version, "distance", true)

first-row = ordered-siwd.row-n(0)

why = transform-column(ordered-siwd, "item", string-length)

XXX = transform-column(
  why,
  "item",
  lam(item):
    string-repeat("X", item)
  end)

employee-earnings = load-table:
  NAME :: String,
  DEPARTMENT :: String, 
  TITLE :: String,
  REGULAR :: String,
  RETRO :: String,
  OTHER :: String,
  OVERTIME :: String,
  INJURED :: String, 
  DETAIL :: String,
  QUINN :: String,
  TOTAL_GROSS :: String,
  POSTAL :: String
  source: csv-table-url("https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/29b3544f-752a-4cb1-a6af-a1de153d20a0/download/employee-earnings-report-2025.csv", default-options)
end

fun earnings-to-number(s :: String) -> Number:
  doc: "Converts a possibly comma-formatted earnings string to a number, using 0 if empty or invalid"
  string-to-number-default(0)(string-replace(s, ",", ""))
where:
  earnings-to-number("1234") is 1234
  earnings-to-number("1,234") is 1234
  earnings-to-number("-1.3") is -1.3
  earnings-to-number("hello") is 0
end

manipulate = (transform-column(transform-column(employee-earnings, "TOTAL_GROSS", earnings-to-number), "DETAIL", earnings-to-number))

fun calc-difference(r :: Row) -> Number:
  doc: "subtracts detail from total gross"
  (get-column(r, "TOTAL_GROSS")) + (get-column(r, "DETAIL"))
end

manipulate-with-diff = build-column(manipulate, "difference", calc-difference)

ordered-sad = order-by(manipulate-with-diff, "difference", true)

ordered-happy = order-by(manipulate-with-diff, "difference", false)