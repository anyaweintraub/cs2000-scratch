use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
include csv


data BookRecord:
  | book(title :: String, author :: String, pages :: Number)
end

the-dispossessed = book("The Dispossessed", "Ursula K. Le Guin", 387)
to-the-lighthouse = book("To the Lighthouse", "Virginia Woolf", 209)
brave-new-world = book("Brave New World", "Aldous Huxley", 268)

fun book-summary(b :: BookRecord) -> String:
  "Title: " + b.title + ", Author: " + b.author + ", Pages: " + num-to-string(b.pages)
end

fun is-long-book(b :: BookRecord) -> Boolean:
  b.pages > 350
end

data Podcast:
  | podcast(title :: String, host :: String, episodes :: Number, avg-duration-mins :: Number)
end

fun podcast-summary(p :: Podcast) -> String:
  p.title + " hosted by " + p.host + ", featuring " + 
  num-to-string(p.episodes) + " episodes (~" + 
  num-to-string(p.avg-duration-mins) + " mins/ep)"
end

data Recipe:
  | recipe(title :: String, servings :: Number, prep-time :: Number)
end

recipes-raw = load-table:
  title :: String,
  servings :: String,
  prep-time :: String
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/5-recipes.csv", default-options)
end

recipes-with-servings = transform-column(recipes-raw, "servings", string-to-number-default(0))
recipes = transform-column(recipes-with-servings, "prep-time", string-to-number-default(0))

fun row-to-recipe(r :: Row) -> Recipe:
  recipe(r["title"], r["servings"], r["prep-time"])
end

sample-recipe = row-to-recipe(get-row(recipes, 0))

recipes-with-objects = build-column(recipes, "recipe-obj", row-to-recipe)
