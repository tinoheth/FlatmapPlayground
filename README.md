# FlatmapPlayground
Recenctly, I came across some posts regarding `map` and `flatMap`, and that they behave strange, especially when dealing with optionals.
I thought those methods can't be that hard, so I created a playgroud to do some experiments...

And to learn something more, I tried out the markup documentation feature of playgrounds as well (this text is only a "preview").

`let words = ["Hello", "this is", "an", "example"]`

We need something to operate on, and an array with some text seems to be the simplest choice. Actually, that is not really true, because Swift handles strings in a very good way (for everyone who is dealing with languages that don't fit into ASCII) that has the downside of beeing quite complicated.


Enough explanation, time to start!

```
var simple = [1, 3, 5].map {
	return $0 * 2
}
```
The result should be `[2, 6, 10]`: `map` just takes every element from the collection, feeds it to the supplied function and puts the result in a new collection.

To make it easier to concentrate on the topic and show that map works with plain old functions as well, we define
```
func extractCharacters(source: String) -> [Character] {
	return Array(source.characters)
}
```
and use it
```
let mapResult = words.map(extractCharacters)
mapResult[0] // ["H", "e", "l", "l", "o"]
```
As I said: We have split each element into its characters.
So, what does `flatMap` do?
```let flatmapResult = words.flatMap(extractCharacters)
// => ["H", "e", "l", "l", "o", "t", "h", "i", "s", " ", "i", "s", "a", "n", "e", "x", "a", "m", "p", "l", "e"]```

Looks similar, but there are not as many arrays - only one, containing the characters of all elements of the input array.
`flatMap` does the same as map, but when the supplied function returns a container, it merges all the results into a "flat" list; when there is nothing to flatten, the result is equal to `map`.
This process happens without recursion, as you can see when you enclose the result in another array:
```
words.flatMap { word in
	return [extractCharacters(word)]
}
```
It is the same output `map` generates without the "boxing".

So far for the preview - if you buy the whole package, you get to see how Dictionaries and Optionals behave, and there's also an additional bonus chapter! You can get all this and more for an incredible price of... ten minutes of your lifetime and the tingling sensation that the playground might enroll your computer into a terrible botnet ;-)
