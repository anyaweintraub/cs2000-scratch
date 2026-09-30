use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
include csv

nhl = load-table:
  rank :: String,
  player :: String,
  age :: String,
  team :: String, 
  pos :: String,
  gp :: String,
  g :: String,
  a :: String,
  pts :: String,
  plus-minus :: String, 
  pim :: String,
  idk-what-this-is :: String
  source: csv-table-url("https://raw.githubusercontent.com/anyaweintraub/cs2000-scratch/refs/heads/main/practicenhl.csv", default-options)
end