use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

data Belt:
  | no-packages
  | parcel(id :: String, pounds :: Number, rest :: Belt)
end

data Sorter:
  | bin(label :: String)
  | gate(limit :: Number, lighter :: Sorter, heavier :: Sorter)
end

morning =
  parcel("A1", 3,
    parcel("B2", 12,
      parcel("C3", 0.5,
        parcel("D4", 30,
          parcel("E5", 7, no-packages)))))

mail-sorter =
  gate(10,
    gate(1, bin("envelopes"), bin("small boxes")),
    gate(25, bin("large boxes"), bin("freight")))

fun belt-pounds(b :: Belt) -> Number:
  doc: "takes a belt and returns the total weight of the parcels"
  cases (Belt) b:
    | no-packages => 0
    | parcel(id, pounds, rest) => pounds + belt-pounds(rest)
  end
where:
  belt-pounds(no-packages) is 0
  belt-pounds(parcel("Z9", 4, no-packages)) is 4
  belt-pounds(morning) is 52.5
end

fun bin-for(s :: Sorter, weight :: Number) -> String:
  doc: "takes in a sorter and a weight and puts the weight of the parcel in a corresponding bin"
  cases (Sorter) s:
    | bin(label) => label
    | gate(limit, lighter, heavier) => 
      if weight < limit:
        bin-for(lighter, weight)
      else:
        bin-for(heavier, weight)
      end
  end
where:
  bin-for(mail-sorter, 3) is "small boxes"
  bin-for(mail-sorter, 0.5) is "envelopes"
  bin-for(mail-sorter, 10) is "large boxes"
  bin-for(mail-sorter, 25) is "freight"
  bin-for(bin("returns"), 12) is "returns"
end

fun packages-for(s :: Sorter, b :: Belt, bin-label :: String) -> Belt:
  doc: "takes in sorter, belt, and bin-label and returns a belt of just the packages that fit in the bin"
  cases (Belt) b:
    | no-packages => no-packages
    | parcel(id, pounds, rest) => 
      if bin-for(s, pounds) == bin-label:
        parcel(id, pounds, packages-for(s, rest, bin-label))
      else:
        packages-for(s, rest, bin-label)
      end
  end
where:
  packages-for(mail-sorter, morning, "small boxes") is parcel("A1", 3, parcel("E5", 7, no-packages))
  packages-for(mail-sorter, morning, "freight") is parcel("D4", 30, no-packages)
  packages-for(mail-sorter, no-packages, "freight") is no-packages
  packages-for(mail-sorter, morning, "returns") is no-packages
end


          
        
          
      

