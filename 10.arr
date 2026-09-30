use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

prices = table: price
      row: 50
      row: 120
      row: 80
      row: 40
      row: 50
      row: 80
      row: 80
    end


fun apply-tax(r :: Row) -> Number:
  doc: "adds new column 'tax' column by multiplying price by 6.25%"
  (get-column(r, "price")) * 0.0625
end

build-column(prices, "tax", apply-tax)



fun obfuscate-column(t :: Table) -> Table:
  doc: "obfuscates column"
  transform-column(t, "item", lam(item): string-repeat("X", string-length(item)) end)
where:
  test-table =
    table: item
      row: "Sword of Dawn"
      row: "Healing Potion"
      row: "Dragon Shield"
      row: "Magic Staff"      
    end

  obfuscate-column(test-table) is
    table: item
      row: "XXXXXXXXXXXXX"
      row: "XXXXXXXXXXXXXX"
      row: "XXXXXXXXXXXXX"
      row: "XXXXXXXXXXX"
    end
end