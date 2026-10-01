use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

include csv
  
voter-data = 
  load-table: VoterID,FirstName,LastName,DOB,Party,Address,City,State,Zip,Phone,Email,LastVoted 
    source: csv-table-file("voters.csv", default-options)
  end

fun blank-to-CA(s :: String) -> String:
  doc: "replaces an empty string with CA"
  if s == "":
    "CA"
  else:
    s
  end
where:
  blank-to-CA("") is "CA"
  blank-to-CA("blah") is "blah"
end
voters-with-CA = transform-column(voter-data, "State", blank-to-CA)