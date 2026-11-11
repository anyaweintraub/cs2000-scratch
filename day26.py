def sum_list(num_list: list[float]) -> float:
    """Returns the sum of all numbers in the list."""
    run_total = 0
    for num in num_list:
        run_total = run_total + num
    return run_total
