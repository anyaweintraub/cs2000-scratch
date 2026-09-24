use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
include csv 

orders = table: time :: String, amount :: Number
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end

fun is-morning(r :: Row) -> Boolean:
  doc: "returns whether the time column represents morning"
  get-column(r, "time") <= "12:00"
end

new-morning-orders = filter-with(orders, is-morning)

order-by(orders, "time", true)

second-workout = get-row(orders, 5)

photo = load-table:
  location :: String,
  subject :: String,
  date :: String
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/7-photos.csv", default-options)
end

fun forest-photo(r :: Row) -> Boolean:
  doc: "returns if the subject is the forest"
  get-column(r, "subject") == "Forest"
end

new-forest-photo = filter-with(photo,forest-photo)

easy = order-by(new-forest-photo, "date", true)

recent-forest = get-row(easy, 8)

get-column(recent-forest, "location")

