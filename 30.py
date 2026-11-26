#level intermediate
import pandas as pd
orders = pd.read_csv("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/restaurant_orders.csv")

high_orders = orders[orders['quantity'] >= 2]
takeout_orders = orders[orders['order_type'] == 'takeout']
orders.sort_values('quantity')                    # ascending
orders.sort_values('quantity', ascending=False)

prices = {'Pasta': 12.0, 'Salad': 8.0, 'Burger': 10.0}
orders['total'] = orders.apply(lambda row: row['quantity'] * prices.get(row['dish'], 0), axis=1)

#discount total by 10%
orders['total'] = orders['total'].apply(lambda price: price * 0.9)

workouts = pd.DataFrame({
    "date": ["2026-11-20", "2026-11-21", "2026-11-22", "2026-11-23", "2026-11-24"],
    "activity": ["Running", "Swimming", "Cycling", "Walking", "Weightlifting"],
    "duration": [30, 45, 60, 25, 50]
})

long_workouts = workouts[workouts['duration'] > 45]

dataex = pd.read_csv("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/7-photos.csv")

forest_photos = dataex[dataex['Subject'] == 'Forest']

workouts.sort_values('duration', ascending=False)
ascending_photos = dataex.sort_values('Date')
ascending_photos.head()

def categorize_workout(duration):
    if duration >= 60:
        return "long"
    elif duration >= 30:
        return "medium"
    else:
        return "short"

workouts['workout_category'] = workouts['duration'].apply(categorize_workout)
workouts['calories_burned'] = workouts['duration'] * 8
dataex["is_landscape"] = (
    dataex["Location"].str.contains("Park|Garden", case=False, na=False)
)

workouts["duration"] = workouts["duration"] / 60
dataex["subject"] = dataex["Subject"].str.upper()


