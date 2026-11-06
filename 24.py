print("hello python")
def gadget_cost(num_gadgets: int, label: str) -> float:
    """computes cost, at $0.50 per gadget plus $0.05 per character in label"""
    return num_gadgets * (0.50 + (len(label) * 0.05))

import pytest

def test_gadget_cost_small() -> None:
    assert gadget_cost(1, "hi") == pytest.approx(0.60)

def test_gadget_cost_medium() -> None:
    assert gadget_cost(10, "tech") == pytest.approx(7.00)

def add_shipping(order_amt: float) -> float:
    """adds 4 for orders <= 10 (but non-zero), 8 for orders < 30, 12 for larger orders"""
    if order_amt == 0:
        return 0
    elif order_amt <= 10:
        return order_amt + 4
    elif order_amt < 30:
        return order_amt + 8
    else:
        return order_amt + 12

def greet(name: str) -> str:
    """produces Hello, name!"""
    return "Hello, " + name + "!"

def test_greet_alice() -> None:
    assert greet("Alice") == pytest.approx("Hello, Alice!")

def name_age(name: str, age: float) -> str:
    return name + " is " + str(age) + " years old."

def test_name_age_alice() -> None:
    assert name_age("Alice", 20) == pytest.approx("Alice is 20 years old.")

def shipping_cost(weight: float) -> float:
    """if weight <= 1, cost is $5; if weight <= 5 cost is $10; else $20"""
    if weight <= 1:
        return 5
    elif weight <= 5:
        return 10
    else:
        return 20

def test_shipping_cost() -> None:
    assert shipping_cost(4) == pytest.approx(10)
