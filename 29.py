#level intermediate
import pandas as pd
data = {
    'date': ['2023-07-01', '2023-07-01', '2023-07-02'],
    'dish': ['Pasta', 'Salad', 'Burger'],
    'quantity': [2, 1, 3],
    'order_type': ['dine-in', 'takeout', 'dine-in']
}
orders = pd.DataFrame(data)
orders2 = pd.read_csv("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/restaurant_orders.csv")
orders.iloc[1]
orders.iloc[1]['dish']

quantities = orders['quantity']

orders['quantity'].mean()     # Series operation
orders['quantity'].sum()

workouts = pd.DataFrame({
    "date": ["2026-11-20", "2026-11-21", "2026-11-22", "2026-11-23", "2026-11-24"],
    "activity": ["Running", "Swimming", "Cycling", "Walking", "Weightlifting"],
    "duration": [30, 45, 60, 25, 50]
})

dataex = pd.read_csv("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/7-photos.csv")

print(dataex.head())

workouts.iloc[1]
workouts['activity']
workouts.iloc[2]['duration']

durations = workouts['duration']

durations.mean()

diff = durations.max() - durations.min()
