def sum_list(num_list: list[float]) -> float:
    """Returns the sum of all numbers in the list."""
    run_total = 0
    for num in num_list:
        run_total = run_total + num
    return run_total

def product_list(nums: list[float]) -> float:
    """return the product of all numbers in the list, the product of an empty list is 1"""
    result = 1
    for num in nums:
        result *= num
    return result

def count_occurences(items: list[str], target: str) -> int:
    """return how many times a target appears in items"""
    count = 0
    for item in items:
        if item == target:
            count += 1
    return count

def filter_by_prefix(words: list[str], prefix: str) -> list[str]:
    """returns words that start with prefix in original order"""
    result = []
    for word in words:
        if word.startswith(prefix):
            result.append(word)
    return result

def reverse_list(lst : list) -> list:
    """return a new list with the elements in reverse order"""
    result = []
    for i in range(len(lst)-1, -1, -1):
        result.append(list[i])
    return result

def all_with_letter(words: list[str], letter: str) -> list[str]:
    """Return all words in words that contain letter, in original order."""
    result = []
    for word in words:
        if letter in word:
            result.append(word)
    return result
