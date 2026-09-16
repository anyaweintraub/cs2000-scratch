use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun welcome(name:: String) -> String:
  doc: "Returns a greeting addressed to the given person"
  "Welcome to class, " + name
end

fun three-layer-cake(top, middle, bottom:: String) -> Image:
  doc: "creates a cake with layers of different flavors"
  frame(
    above(rectangle(120, 30, "solid", top),
      above(rectangle(120, 30, "solid", middle),
        rectangle(120, 30, "solid", bottom))))
end

fun tshirt-cost(num-shirts:: Number, message:: String) -> Number:
  doc: "returns the total cost of the number of shirts plus the cost of the message on each shirt. each shirt is five dollars and each additional letter is ten cents"
  num-shirts * (5 + (string-length(message) * 0.10))
where: 
  tshirt-cost(4, "Go Team!")
    is 4 * (5 + (string-length("Go Team!") * 0.10))
  tshirt-cost(7, "Hello World")
    is 7 * (5 + (string-length("Hello World") * 0.10))
end
