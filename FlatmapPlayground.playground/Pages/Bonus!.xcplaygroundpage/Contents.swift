//: [Previous](@previous)
//:## Bonus: Some spice
var words = ["Hello", "this is", "an", "example"]
/*:
So, for all this map-stuff we need functions that operate on objects... and many objects already have a bunch of those: Their methods!\
Wouldn't it be nice to use them? It's possible, but needs some work:\
There is a simple way to handle a method as a function - but it is always curried (search for depth explanation of the term), so we don't get the result why might hope for:
*/
extension Int {
	func successor() -> Int {
		return self + 1
	}
}
print([1, 2, 3].map(Int.successor))
/*:
An array of functions - that could be useful when we want to do some lazy computing. Of course, there is some functional voodoo to use those methods as normal functions:
*/
func call<V, T>(func f: @escaping (V) -> (() -> T)) -> (V) -> T {
	return { s in f(s)() }
}
print([1, 2, 3].map(call(func: Int.successor)))
/*:
That looks more complicated than it is:
The call function removes one layer of curry(?:) from the function it is applied to.
*/
/*:
## This is for the lazy ones
So, currying can be used for lazy evalution - but it is ugly.
This is better:
*/
let wait = words.lazy.map { (word: String) -> String in
	print(word)
	return word.uppercased()
}
print(wait[0])
/*:
Looking at the output, you should see "Hello" (output of the print-statement in line 27) and "HELLO", which is the first element of `wait` - but note that `wait` has no real elements at all:\
It just has a reference to `words`, and when you pick an element, it generates the result by applying your function to the element of the underlying collection.
---
As a passionate Swift-coder you might have wondered why `words` wasn't introduced as a constant (using `let` instead of `var`).\
Well, I wanted to test my own claim about the relationship between `words` and `wait`:
*/
words.append("What will happen?")
print(wait.last!)
//:So the `lazy`-property might be using a reference, but in this case, it uses copy-on-write semantics (which I would expect of something that is called "lazy" ;-)
