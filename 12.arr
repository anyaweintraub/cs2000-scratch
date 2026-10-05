use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

weather-data =
  table: date, temperature, precipitation
    row: "2025-01-01", 62, 0.1
    row: "2025-01-02", "45", 3
    row: "2025-01-03", 28, 0.2
    row: "2025-01-04", 55, 1
    row: "2025-01-05", 90, 0
  end

fun normalize-temp(v) -> Number:
  doc: "given a number or a string that represents a number, converts to a number"
  if is-string(v): 
    string-to-number(v).or-else(0)
  else: 
    v
  end
where:
  normalize-temp(10) is 10
  normalize-temp("13") is 13
end

fixed-data = transform-column(weather-data, "temperature", normalize-temp)

fun bucket-temp(t :: Number) -> String:
  doc: "numbers < 40 turn into 'cold', >=40 and < 60 to 'mild' and >=60 to 'hot'"
  if t < 40:
    "cold"
  else if t < 60:
    "mild"
  else:
    "hot"
  end
where:
  bucket-temp(-10) is "cold"
  bucket-temp(0) is "cold"
  bucket-temp(39.9) is "cold"
  bucket-temp(40) is "mild"
  bucket-temp(58) is "mild"
  bucket-temp(60) is "hot"
  bucket-temp(100) is "hot"
end

with-buckets = build-column(fixed-data, "temp-category", lam(r :: Row) -> String: bucket-temp(get-column(r, "temperature")) end)

freq-bar-chart(with-buckets, "temp-category")


fun bucket-rain(p :: Number) -> String:
  doc: "numbers = 0 are dry, num <1 are drizzly, num >= 1 are wet"
  if p == 0:
    "dry"
  else if p < 1:
    "drizzly"
  else:
    "wet"
  end
where:
  bucket-rain(10) is "wet"
  bucket-rain(0) is "dry"
  bucket-rain(0.5) is "drizzly"
  bucket-rain(40) is "wet"
end

with-rainbuckets = build-column(with-buckets, "rain-category", lam(r :: Row) -> String: bucket-rain(get-column(r, "precipitation")) end)

freq-bar-chart(with-rainbuckets, "rain-category")