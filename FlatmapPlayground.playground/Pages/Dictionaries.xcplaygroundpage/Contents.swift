//: [Previous](@previous)
/*:
## Dictionaries
Let's try the same with another type of container:
*/
let dictionary = ["a": 1, "c": 5]

dictionary.map { (pair: (String, Int)) in
	return pair.0 + " is " + String(pair.1)
}
/*:
In this case, we have to deal with a tuple of key and value. Dictionaries aren't simple arrays containing tuples, but it behaves as if when we iterate through it.\
Note that our output is an array, not a dictionary. This is most likely just because of the the `CollectionType`-protocol, and it can make perfect sense
to create a map-like method that returns a dictionary with transformed values.
*/
let complexDictionary = ["a": ["value": 1], "c": ["value": 5, "and": 6]]
let complexResult = complexDictionary.flatMap {
	return $1
}
print(complexResult)
//: I hope you belive me that there is nothing special with `Set` and other containers, so let's talk about [Optionals](@next)
