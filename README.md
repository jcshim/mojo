# mojo
mojo language

## 컴파일
### $ nano hello.mojo
### $ mojo hello.mojo
### $ ./hello

## 실행파일
### $ mojo build hello.mojo
### $ ./hello

```hello.mojo
def main():
    print("Hello Mojo 🔥!")
    for x in range(9, 0, -3):
        print(x, end=" ")
```

```add.mojo
fn add(a: Int, b: Int) -> Int:
    return a + b

fn main():
    print(add(5, 3))
```

```add_key.mojo
from python import Python

fn add(a: Int, b: Int) -> Int:
        return a + b

fn main() raises:
        var py = Python.import_module("builtins")
        var i1 = py.input("1st: ")
        var i2 = py.input("2nd: ")

        print("The sum is: ",  add( py.int(i1), py.int(i2)));
```
