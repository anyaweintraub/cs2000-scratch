use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

tri-length = 35
tri-color = "orange"
color-triangle = triangle(tri-length, "solid", tri-color)

my-color = "blue"
my-side-length = 50

special-square = square(my-side-length, "solid", my-color)

special-square2 = square(50, "solid", "blue")

evil = overlay(circle(5, "solid", "yellow"), rectangle(40, 60, "solid", "black"))

yellow-circ = circle(5, "solid", "yellow")
black-rect = rectangle(40, 60, "solid", "black")

nice = overlay(yellow-circ, black-rect)

two-circs = beside(yellow-circ, yellow-circ)

double-circ-rect = overlay(two-circs, black-rect)
