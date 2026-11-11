x = 10
x = 20  # x is now 20 -- all variables are mutable

y = 5
y = y + 2  # y is now 7

# Scoping example:
y = 20
def f():
    y = 30  # This is a new local y, does not affect global y
    return y
print(f())  # prints 30
print(y)    # prints 20

# Using global keyword:
z = 100
def g():
    global z # Now `z` within function is same as `z` at top level
    z = 200
g()
print(z)    # prints 200

#local variable y referenced before assignment, fixed
y = 100
def outer():
    y = 200
    def inner():
        global y
        y = y + 50
        return y
    return inner()
print(outer())   # 150
print(y)         # 150

#not a variable, so fix by making it a var

#need to call global x
x = 10
def foo():
    global x
    x = x + 1
    return x
print(foo())   # 11
print(x)       # 11