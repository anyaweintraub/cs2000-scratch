use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun choose-hat(temp-in-F :: Number) -> String:
  doc: "determines appropriate head gear, with above 80F a sun hat, below nothing"
  if temp-in-F >= 80:
    "sun hat"
  else if temp-in-F < 50:
    "winter hat"
  else:
    "no hat"
  end 
where:
  choose-hat(50) is "no hat"
  choose-hat(85) is "sun hat"
  choose-hat(80) is "sun hat"
  choose-hat(40) is "winter hat"
end


fun add-glasses(outfit:: String) -> String:
  doc: "adds glasses to every outfit"
  outfit + ", and glasses"
end

fun choose-outfit(temp-in-F :: Number) -> String:
  doc: "determines hat based on temp and adds glasses to complete the outfit"
  add-glasses(choose-hat(temp-in-F))
where:
  choose-outfit(85) is "sun hat, and glasses"
  choose-outfit(60) is "no hat, and glasses"
  choose-outfit(40) is "winter hat, and glasses"
end


fun choose-hat-or-visor(temp-in-F :: Number, has-visor:: Boolean) -> String:
  doc: "determines appropriate head gear, with above 80F a sun hat, below nothing, above 95F a visor if owns"
  if (temp-in-F > 95) and has-visor:
    "visor"
  else:
    choose-hat(temp-in-F)
  end 
where:
  choose-hat-or-visor(50, false) is "no hat"
  choose-hat-or-visor(100, true) is "visor"
  choose-hat-or-visor(100, false) is "sun hat"
  choose-hat-or-visor(40, true) is "winter hat"
end
