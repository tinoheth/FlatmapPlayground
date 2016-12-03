//: [Previous](@previous)
/*:
## Optionals
Time to look at Optionals - map and flatMap are defined for those as well.
*/
let container: Character? = "A"
let mapCharacter = container.map { character in
	return character
}
print(mapCharacter ?? "Nil")
let flatMapCharacter = container.flatMap { (character: Character) in
	return character
}
print(flatMapCharacter ?? "Nil")
/*:
Not that amazing. Maybe there is something special with nil?
*/
let emptyContainer: Character? = nil
emptyContainer.map {
	return $0
}
emptyContainer.flatMap {
	return $0
}
//: No, not really - nil in, nil out. So, where is the "magic" of flatMap?
let missingWords: [String?] = ["This", nil, "missing"]
missingWords.map {
	return $0
}
missingWords.flatMap {
	return $0
}
/*:
So, flatMap cleans out the nil-values... that could be handy, and the reason is not that strange:\
You can think of an Optional as an array that can contain one item at most; then, nil is just an empty container.
As we learned before, flatMap unboxes the results of the supplied function, so nil (empty array) is simply ignored in the final result.
*/
// missingWords.flatten() // Doesn't work because of strange error... but should do the same
//: Finally, just to show that both Array and Optional act as containers:
missingWords.flatMap { word -> Array<Character> in
	let result: Array<Character>
	if let word = word {
		result = Array(word.characters)
	} else {
		result = Array<Character>()
	}
	return result
}
missingWords.flatMap { word -> Array<Character>? in
	let result: Array<Character>?
	if let word = word {
		result = Array(word.characters)
	} else {
		result = Array<Character>()
	}
	return result
}
//: [Next](@next)
