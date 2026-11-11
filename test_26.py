import pytest
from day26 import *

def test_sum_list_empty():
    assert sum_list([]) == 0

def test_sum_list_nonempty():
    assert sum_list([1, 2, 3]) == 6