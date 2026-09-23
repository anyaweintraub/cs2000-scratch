use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

include csv
monthly-crime-data = load-table:
  month_year :: String,
  area-type :: String,
  borough_snt :: String, 
  area_name :: String,
  area_code :: String,
  crime_type :: String,
  crime_subtype :: String,
  measure :: String,
  financial_year :: String, 
  count :: String,
  refresh_date :: String
  source: csv-table-url("https://data.london.gov.uk/download/e5n6w/qbc/M1045_MonthlyCrimeDashboard_KnifeCrimeData.csv", default-options)
end
  