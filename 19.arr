use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

data PaymentMethod:
  | cash
  | credit(card-number :: String, expiry :: String)
  | checking(bank-account :: String, routing :: String, check-number :: Number)
end

payment-1 = cash
payment-2 = credit("1111-2222-3333-4444", "09/26")
payment-3 = checking("987654321", "111", 55)

fun display-payment(p :: PaymentMethod) -> String:
  cases (PaymentMethod) p:
    | cash => "Paid in cash"
    | credit(cn, exp) => "Paid by credit card expiring on " + exp
    | checking(acc, rout, num) => "Paid by check from account " + acc
  end
end

data Vehicle:
  | bike
  | car(make :: String, year :: Number)
  | truck(make :: String, year :: Number, capacity :: Number)
end

vehicle-1 = bike
vehicle-2 = car("Toyota", 2020)
vehicle-3 = truck("Ford", 2018, 5)

fun vehicle-age(v :: Vehicle, current-year :: Number) -> Number:
  cases (Vehicle) v:
    | bike => 0
    | car(make, year) => current-year - year
    | truck(make, year, capacity) => current-year - year
  end
end

data Grade:
  | letter(grade :: String)
  | percent(score :: Number)
  | pass-fail(passed :: Boolean)
end

grade-1 = letter("A")
grade-2 = percent(90)
grade-3 = pass-fail(true)

fun grade-to-gpa(g :: Grade) -> Number:
  cases (Grade) g:
    | letter(grade) =>
      if grade == "A":
        4.0
      else if grade == "B":
        3.0
      else if grade == "C":
        2.0
      else if grade == "D":
        1.0
      else:
        0.0
      end
    | percent(score) =>
      if score >= 90:
        4.0
      else if score >= 80:
        3.0
      else if score >= 70:
        2.0
      else if score >= 60:
        1.0
      else:
        0.0
      end
    | pass-fail(passed) =>
      if passed:
        4.0
      else:
        0.0
      end
  end
where:
  grade-to-gpa(letter("A")) is 4.0
  grade-to-gpa(letter("C")) is 2.0
  grade-to-gpa(letter("F")) is 0.0
  grade-to-gpa(percent(95)) is 4.0
  grade-to-gpa(percent(85)) is 3.0
  grade-to-gpa(percent(75)) is 2.0
  grade-to-gpa(percent(65)) is 1.0
  grade-to-gpa(percent(50)) is 0.0
  grade-to-gpa(pass-fail(true)) is 4.0
  grade-to-gpa(pass-fail(false)) is 0.0
end

fun payment-summary(p :: PaymentMethod) -> String:
  cases (PaymentMethod) p:
    | cash => "Cash payment"
    | credit(number, expiry) =>
      "Card ending in " + string-substring(number,
        string-length(number) - 4,
        string-length(number))
    | checking(check-number) =>
      "Check #" + num-to-string(check-number)
  end
where:
  payment-summary(cash) is "Cash payment"
  payment-summary(credit("1234567890123456", "2020")) is "Card ending in 3456"
end

data WeatherReport:
  | sunny(temperature :: Number)
  | rainy(temperature :: Number, precipitation :: Number)
  | snowy(temperature :: Number, precipitation :: Number, wind-speed :: Number)
end

sunny-day = sunny(98)
rainy-day = rainy(70, 3)
snowy-day = snowy(25, 4, 35)

fun is-severe(w :: WeatherReport) -> Boolean:
  cases (WeatherReport) w:
    | sunny(temperature) =>
      temperature > 95
    | rainy(temperature, precipitation) =>
      precipitation > 2
    | snowy(temperature, precipitation, wind-speed) =>
      wind-speed > 30
  end
where:
  is-severe(sunny(98)) is true
  is-severe(sunny(90)) is false
  is-severe(rainy(70, 3)) is true
  is-severe(rainy(70, 1)) is false
  is-severe(snowy(25, 4, 35)) is true
  is-severe(snowy(25, 4, 20)) is false
end