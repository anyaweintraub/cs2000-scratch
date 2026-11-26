#level advanced
def calculate_bonus(years_of_service: int, performance_rating: str) -> int:
    if performance_rating == "excellent":
        base = 10
    elif performance_rating == "good":
        base = 5
    elif performance_rating == "satisfactory":
        base = 2
    else:
        base = 0
        
    if years_of_service >= 5:
        return base + 3
    else:
        return base

def test_calculate_bonus():
    assert calculate_bonus(2, "excellent") == 10
    assert calculate_bonus(5, "excellent") == 13
    assert calculate_bonus(6, "good") == 8
    assert calculate_bonus(3, "satisfactory") == 2
    assert calculate_bonus(1, "needs improvement") == 0