use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
import lists as L
include csv



discount-codes = [list: "NEWYEAR", "student", "NONE", "student", "VIP", "none"]

unique-codes = L.distinct(discount-codes)

fun is-real-code(code :: String) -> Boolean:
  not(string-to-lower(code) == "none")
end

real-codes = L.filter(is-real-code, unique-codes)

first-code = L.get(real-codes,0)

lower-codes = L.map(string-to-lower, real-codes)

upper-codes = L.map(string-to-upper, unique-codes)

unique-upper-codes = L.distinct(upper-codes)

survey = [list: "yes", "NO", "maybe", "Yes", "no", "Maybe"]

lower-survey = L.map(string-to-lower, survey)

unique-survey = L.distinct(lower-survey)

fun is-definitive(code :: String) -> Boolean:
  not(string-to-lower(code) == "maybe")
end

definitive-survey = L.filter(is-definitive, unique-survey)

products =
table: name :: String, price :: Number
  row: "laptop", 999.99
  row: "mouse", 25.50
  row: "keyboard", 75.00
  row: "monitor", 299.99
end

price = get-column(products, "price")

fun is-cheap(n :: Number) -> Boolean:
  if (n < 100):
    true
  else:
    false
  end
end

cheap-price = L.filter(is-cheap, price)

ten-percent-off = L.map(lam(x): x * 0.9 end, cheap-price)

fruits = [list: "apple", "banana", "cherry", "date", "elderberry"]

third-fruit = L.get(fruits,2)

fun is-long(s :: String) -> Boolean:
  if string-length(s) > 5:
  true
  else:
  false
end
end

long-fruits = L.filter(is-long, fruits)

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

name = get-column(employee-earnings, "NAME")

fun is-smith(s :: String) -> Boolean:
  if string-contains(s, "Smith"):
  true
  else:
  false
end
end

smith-names = L.filter(is-smith, name)

student-names = [list: "alice", "Bob", "CHARLIE", "diana"]

fun to-proper-case(s :: String) -> String:
  if string-length(s) == 0:
    s
  else:
    first-char = string-to-upper(string-substring(s, 0, 1))
    rest-chars = string-to-lower(string-substring(s, 1, string-length(s)))
    first-char + rest-chars
  end
end

normalized-names = L.map(to-proper-case, student-names)

