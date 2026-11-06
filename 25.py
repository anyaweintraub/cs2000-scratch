fruits = ["apple", "banana", "cherry", "date"]
fruits_with_a = list(filter(lambda f: "a" in f, fruits))
fruits_upper = list(map(lambda f: f.upper(), fruits))
from dataclasses import dataclass

@dataclass
class Fruit:
    name: str
    color: str

first_ten = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
first_ten_squared = list(map(lambda n: n * n, first_ten))

def all_evens(nums: list) -> list:
    """returns a list of all evens from the input list"""
    return list(filter(lambda num: num % 2 == 0, nums))
import pytest

def test_all_evens() -> None:
    assert all_evens(first_ten) == pytest.approx([2, 4, 6, 8, 10])

def capitalize_all(words: list) -> list:
    """capitalizes all words"""
    return list(map(str.capitalize, words))

def test_capitalize_all() -> None:
    assert capitalize_all(fruits) == pytest.approx(["Apple", "Banana", "Cherry", "Date"])

words = ["hello", "world", "python"]

word_lengths = list(map(lambda word: len(word), words))

print(word_lengths)

@dataclass
class Book:
    title: str
    author: str
    pages: int

def long_books(books: list[Book]) -> list[str]:
    """Returns a list of titles of books that have more than 300 pages."""
    return [book.title for book in books if book.pages > 300]

library = [
        Book(title="The Hobbit", author="J.R.R. Tolkien", pages=310),
        Book(title="The Fellowship of the Ring", author="J.R.R. Tolkien", pages=423),
        Book(title="The Great Gatsby", author="F. Scott Fitzgerald", pages=180),
        Book(title="1984", author="George Orwell", pages=328),
        Book(title="Animal Farm", author="George Orwell", pages=112),
    ]

def filter_by_author(books: list[Book], author: str) -> list[str]:
    """Returns a list of titles of books written by the specified author."""
    return [book.title for book in books if book.author.lower() == author.lower()]

found_long_books = long_books(library)
orwell_books = filter_by_author(library, "George Orwell")

def test_long_books() -> None:
    assert long_books(library) == pytest.approx(found_long_books)

def test_author_filter() -> None:
    assert filter_by_author(library, "George Orwell") == pytest.approx(orwell_books)