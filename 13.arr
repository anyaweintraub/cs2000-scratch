use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
include csv
import math as M
import statistics as S

cafe-data =
  table: day :: String, drinks-sold :: Number
    row: "Mon", 45
    row: "Tue", 30
    row: "Wed", 55
    row: "Thu", 40
    row: "Fri", 60
  end


sales = get-column(cafe-data, "drinks-sold")
M.max(sales)      # maximum sales
S.mean(sales)     # average sales
M.sum(sales)      # total sold

get-column(cafe-data, "drinks-sold")

days = get-column(cafe-data, "day")
M.min(days)

quiz-scores =
  table: student :: String, quiz1 :: Number, quiz2 :: Number, quiz3 :: Number
    row: "Alice", 85, 92, 78
    row: "Bob", 90, 88, 95
    row: "Charlie", 78, 85, 82
    row: "Diana", 95, 90, 88
  end

quiz1 = get-column(quiz-scores, "quiz1")
quiz2 = get-column(quiz-scores, "quiz2")
quiz3 = get-column(quiz-scores, "quiz3")
S.mean(quiz1)
S.mean(quiz2)
S.mean(quiz3)

[list: 12, 8, 15, 22, 5, 18]
M.min([list: 12, 8, 15, 22, 5, 18])
M.max([list: 12, 8, 15, 22, 5, 18])
M.sum([list: 12, 8, 15, 22, 5, 18])

M.max([list: 12, 8, 15, 22, 5, 18]) - M.min([list: 12, 8, 15, 22, 5, 18])

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

new-ee = transform-column(employee-earnings, "REGULAR", earnings-to-number)

meansalary = get-column(new-ee, "REGULAR")
S.mean(meansalary)