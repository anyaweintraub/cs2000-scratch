use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

import lists as L
import math as M

fun fare(ride :: String) -> Number:
  doc: "returns the fare for a given mode of travel"
  if ride == "bus":
    2
  else if ride == "subway":
    3
  else:
    4
    end
where:
  fare("bus") is 2
  fare("subway") is 3
  fare("ferry") is 4
end

fun fares(ride-list :: List<String>) -> List<Number>:
  doc: "takes a ride list and returns the corresponding fares in order as a list"
  L.map(fare, ride-list)
where:
  fares([list: "bus", "ferry", "bus"]) is [list: 2, 4, 2]
  fares([list: "subway"]) is [list: 3]
  fares([list: ]) is [list: ]
  fares([list: "ferry", "subway"]) is [list: 4, 3]
end
  
fun declined-rides(ride-list :: List<String>, balance :: Number) -> Number block:
  doc: "returns the number of declined rides given a balance and the list of rides"
  var declined = 0
  var updated-balance = balance
  for each(ride from ride-list):
    if fare(ride) <= updated-balance:
      updated-balance := updated-balance - fare(ride)
    else:
      declined := declined + 1
    end
  end
  declined
where:
  declined-rides([list: ], 10) is 0
  declined-rides([list: "bus"], 1) is 1
  declined-rides([list: "subway", "bus"], 5) is 0
  declined-rides([list: "ferry", "subway", "bus"], 6) is 1
  declined-rides([list: "subway", "subway", "subway"], 7) is 1
  declined-rides([list: "bus", "ferry", "subway"], 8) is 1
end

tuesday = table: time :: String, ride :: String
  row: "8:05", "subway"
  row: "12:30", "bus"
  row: "17:45", "ferry"
  row: "19:10", "subway"
  row: "22:00", "bus"
end

fun card-report(ride-table :: Table, balance :: Number) -> String:
  doc: "takes in a table containing each day's rides and returns declined rides and full fares as a string"
  "Declined: " + num-to-string(declined-rides(get-column(ride-table, "ride"), balance)) + " of " + num-to-string(table-length(ride-table)) + " rides, full fares: $" + num-to-string(M.sum(fares(get-column(ride-table, "ride"))))  
where:
  card-report(tuesday, 11) is "Declined: 1 of 5 rides, full fares: $14"
end

fun card-image(ride-list :: List<String>) -> Image block:
  doc: "takes in a ride list and returns an image with color-coded squares for each type of ride in order"
  var card = empty-image
  for each(ride from ride-list):
    if ride == "bus":
      card := beside(card, square(40, "solid", "yellow"))
    else if ride == "subway":
      card := beside(card, square(40, "solid", "green"))
    else:
      card := beside(card, square(40, "solid", "blue"))
    end
  end
  card
end

card-image([list: ])
card-image([list: "bus"]) 
card-image([list: "subway", "bus"])
card-image([list: "ferry", "subway", "bus"]) 
card-image([list: "subway", "subway", "subway"])
  
   