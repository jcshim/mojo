# mojo
mojo language

```mojo1
def main():
    print("Hello Mojo 🔥!")
    for x in range(9, 0, -3):
        print(x, end=" ")
```

```mojo2
fn add(a: Int, b: Int) -> Int:
    return a + b

fn main():
    print(add(5, 3))
```

```mojo3
from python import Python

fn add(a: Int, b: Int) -> Int:
        return a + b

fn main() raises:
        var py = Python.import_module("builtins")
        var i1 = py.input("1st: ")
        var i2 = py.input("2nd: ")

        print("The sum is: ",  add( py.int(i1), py.int(i2)));
```
