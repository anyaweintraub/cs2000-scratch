import pytest
from day26 import *

def test_sum_list_empty():
    assert sum_list([]) == 0

def test_sum_list_nonempty():
    assert sum_list([1, 2, 3]) == 6

def test_product_list_negatives_and_floats():
    assert product_list([-2, 3]) == -6
    assert product_list([0.5, 4]) == 2.0
 