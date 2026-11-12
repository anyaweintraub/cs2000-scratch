from dataclasses import dataclass

@dataclass
class LibraryBook:
    id: int
    title: str
    copies: int

book1 = LibraryBook(101, "The Curious Incident", 5)
book2 = book1
book1.copies = book1.copies - 1
# book2.copies is now 4, because book2 is an alias for book1

book3 = LibraryBook(101, "The Curious Incident", 5)
print(book1 == book3)  # True if contents are the same
print(book1 is book3)  # False, different objects
print(book1 is book2)  # True, same object (alias)

# prints  [1, 2, 3, 4]
# prints 20
# 4 prints t, f, t
# 5 prints t

def add_item(my_list, item):
    my_list.append(item)
    return my_list

original = [1, 2]
result1 = add_item(original, 3)
result2 = add_item(original, 4)
print(original)
print(result1)
print(result2)

# prints [1, 2, 3, 4] x3
# 7 prints 1
# [10, 99, 30]
# false
# true
# true