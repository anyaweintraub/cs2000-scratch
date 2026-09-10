use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

string-to-upper("hello cs2000!")

circle(30, "solid", "blue")
rectangle(40, 60, "solid", "yellow")

overlay(circle(30, "solid", "blue"),rectangle(40, 60, "solid", "yellow"))

above(rectangle(20, 40, "solid", "green"), rectangle(20, 40, "solid", "purple"))

rectangle(100, 20, "solid", "red")

rotate(45, rectangle(100, 20, "solid", "red"))

overlay(text(string-to-upper("stop"), 30, "white"), regular-polygon(40, 8, "solid", "red"))

triangle(20, "outline", "yellow")