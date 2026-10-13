use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun is-valid-percent(n :: Number) -> Boolean:
  doc: "takes a number and returns true if between 0 and 100 inclusive"
  if (0 <= n) and (n <= 100):
    true
  else:
    false
  end
where: 
  is-valid-percent(0) is true
  is-valid-percent(100) is true
  is-valid-percent(-1) is false
end

fun fill-color(n :: Number) -> String:
  doc: "takes a percentage and returns a color either red, gold green"
  if n < 50:
    "red"
  else if n == 100:
    "green"
  else:
    "gold"
  end
where: 
  fill-color(0) is "red"
  fill-color(97) is "gold"
  fill-color(100) is "green"
end

fun fill-rect(n :: Number) -> Image:
  doc: "takes a percentage and creates a solid rectangle based on those values"
  if n == 0:
    empty-image
  else:
    rectangle((n * 2), 24, "solid", fill-color(n))
    end
end

fun progress-bar(n :: Number) -> Image:
  doc: "for a valid percentage creates a progress bar"
  if is-valid-percent(n):
    outline-rectangle = rectangle(200, 24, "outline", "black")
    overlay-align("left", "middle", fill-rect(n), outline-rectangle)
  else:
    overlay-align("center", "middle", text("?", 30, "black"), rectangle(100, 50, "solid", "red"))
  end
end
  
fun labeled-bar(n :: Number) -> Image:
  doc: "takes a percentage and returns an image with progress bar and percent"
  if is-valid-percent(n):
    above(progress-bar(n), text(num-to-string(n), 20, "white"))
  else:
    above(progress-bar(n), text("invalid", 20, "white"))
  end
end
    
    
    
  
  
  
  
  