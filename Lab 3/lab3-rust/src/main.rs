/*  Jacobus Burger
    CMPT 360A, Spring 2021
    Lab Assignment 3
    Implementation and Application of the Stack Abstract Data Type in Rust
*/


// stack ADT with accompanying implementation for generic type `T`
struct Stack<T> {
    stack: Vec<T>,
}

impl<T> Stack<T> {
    fn new() -> Self { // not to be confused with self or &self ;^)
        Stack { stack: Vec::new() }
    }

    fn push(&mut self, item: T) {
        self.stack.push(item)
    }

    fn pop(&mut self) -> Option<T> {
        self.stack.pop()
    }

    fn length(&self) -> usize {
        self.stack.len()
    }

    fn is_empty(&self) -> bool {
        self.stack.is_empty()
    }

    fn peek(&self) -> Option<&T> {
        self.stack.last()
    }
}


// demo function that reverses the characters of each word in a string.
// eg: "Hello, World!" => ",olleH !dlroW"
fn word_reverse(s: String) -> String {
    let mut reverser: Stack<char> = Stack::new();
    let mut result: String = "".to_string();
    for word in s.split_whitespace() {
        for chars in word.chars() {
            reverser.push(chars);
        }
        for _chars in word.chars() {
            result.push(reverser.pop().unwrap());
        }
        result.push(' ');
    }
    result.pop(); // remove trailing whitespace
    return result
}


// main function to test stack ADT impl
fn main() {
    // test out basics of stack ADT
    let mut stack: Stack<i32> = Stack::new();
    assert_eq!(stack.length(), 0);
    assert_eq!(stack.is_empty(), true);
    stack.push(1);
    assert_eq!(stack.length(), 1);
    assert_eq!(stack.is_empty(), false);
    assert_eq!(stack.peek().unwrap(), &1i32);  // safety through pedantics, that's rust for you...
    stack.pop();
    assert_eq!(stack.pop(), None);  // `Option<T>` is just a crummier `Maybe T`
    
    // test out stack ADT operability with word reverser
    let s: String = "Hello, World! 你好，世界！ eusruP eht reredrum fo !snocixel - anna Marg annagram".to_string();  // ¯\_(ツ)_/¯
    let r: String = word_reverse(s.clone());
    println!("String '{}' became '{}'\n", s, r);
}
