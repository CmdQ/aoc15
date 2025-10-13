"
I represent day 10 of the Advent of Code 2015 puzzles.

I solve the 'Elves Look, Elves Say' problem.
"
Class {
	#name : #Day10,
	#superclass : #Day,
	#category : #AoC2015
}

{ #category : #expecting }
Day10 >> answer1 [
	^ 252594
]

{ #category : #data }
Day10 >> atoms [
	^ '111312211312113221133211322112211213322112
111312211312113221133211322112211213322113
1321132122211322212221121123222112
1321132122211322212221121123222113
13112221133211322112211213322112
13112221133211322112211213322113
1113122113322113111221131221
3113112211322112211213322112
3113112211322112211213322113
312211322212221121123222112
312211322212221121123222113
11131221131211322113322112
111312212221121123222112
111312212221121123222113
311311222113111221131221
12322211331222113112211
31131122211311122113222
132211331222113112211
13211321222113222112
13211322211312113211
111312211312113211
132112211213322112
132112211213322113
311311222113111221
13221133122211332
3113112211322112
3113112221131112
3113112221133112
311322113212221
11131221131112
11131221131211
11131221133112
11131221222112
31121123222112
31121123222113
1322113312211
111213322112
111213322113
111311222112
111312211312
132113212221
311311222112
311311222113
13221133112
1113122112
1113122113
1113222112
1113222113
1321122112
1321131112
1321133112
3113112211
3113322112
3113322113
123222112
123222113
311311222
11131221
11133112
13122112
13211312
13211321
31131112
1112133
1113222
1321132
1322112
1322113
3112112
3112221
111312
131112
132112
132113
311311
311312
311332
11131
11132
13211
31132
32112
1112
1113
3112
3113
132
312
12
13
22
3'
]

{ #category : #input }
Day10 >> input [
	^ '1113222113'
]

{ #category : #'examples - input' }
Day10 >> input1 [
	<gtExample>
	| res |
	res := self solveOnce: '1'.
	self assert: res equals: '11'.
	^ res
]

{ #category : #'examples - input' }
Day10 >> input2 [
	<gtExample>
	| res |
	res := self solveOnce: '11'.
	self assert: res equals: '21'.
	^ res
]

{ #category : #'examples - input' }
Day10 >> input3 [
	<gtExample>
	| res |
	res := self solveOnce: '21'.
	self assert: res equals: '1211'.
	^ res
]

{ #category : #'examples - input' }
Day10 >> input4 [
	<gtExample>
	| res |
	res := self solveOnce: '1211'.
	self assert: res equals: '111221'.
	^ res
]

{ #category : #'examples - input' }
Day10 >> input5 [
	<gtExample>
	| res |
	res := self solveOnce: '111221'.
	self assert: res equals: '312211'.
	^ res
]

{ #category : #solution }
Day10 >> solve: aString withRepetition: anInteger [
	| iter |
	iter := aString.
	1 to: anInteger do: [ :ignored | iter := self solveOnce: iter ].
	^ iter size
]

{ #category : #solution }
Day10 >> solveOnce: num [
	| stream re |
	stream := num readStream.
	re := '' writeStream.
	[ stream atEnd ]
		whileFalse: [ | what count |
			what := stream next.
			count := 1.
			[ stream atEnd not and: [ stream peek = what ] ]
				whileTrue: [ stream next.
					count := count + 1 ].
			re nextPutAll: count asString.
			re nextPut: what ].
	^ re contents
]

{ #category : #solution }
Day10 >> solvePart1: aString [
	^ self solve: aString withRepetition: 40
]

{ #category : #solution }
Day10 >> solvePart2: aString [
	self shouldBeImplemented
]

{ #category : #'examples - solution' }
Day10 >> solvedPart1 [
	<gtExample>
	^ super solvedPart1
]

{ #category : #'examples - solution' }
Day10 >> solvedPart2 [
	<gtExample>
	^ super solvedPart2
]
