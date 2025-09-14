"
I represent day 4 of the Advent of Code 2015 puzzles.

I solve the 'The Ideal Stocking Stuffer' problem.
"
Class {
	#name : #Day04,
	#superclass : #Day,
	#category : #AoC2015
}

{ #category : #'as yet unclassified' }
Day04 >> answer1 [
	^ 346386
]

{ #category : #'as yet unclassified' }
Day04 >> answer2 [
	^ 9958218
]

{ #category : #input }
Day04 >> input [
	^ 'iwrupvqb'
]

{ #category : #'examples - input' }
Day04 >> inputAlphabetEndish [
	<gtExample>
	| res |
	res := self solvePart1: 'pqrstuv'.
	self assert: res equals: 1048970.
	^ res
]

{ #category : #'examples - input' }
Day04 >> inputAlphabetStart [
	<gtExample>
	| res |
	res := self solvePart1: 'abcdef'.
	self assert: res equals: 609043.
	^ res
]

{ #category : #'as yet unclassified' }
Day04 >> solve: aString withLeadingZeros: anInteger [
| md5 prefix |
	md5 := MD5 new.
	prefix := '0' repeat: anInteger.
	0
		to: (2 raisedToInteger: 30)
		do: [ :n | 
			((md5 hashMessage: aString , n asString) hex beginsWith: prefix)
				ifTrue: [ ^ n ] ].
	^ 'upper threshold too low'
]

{ #category : #solution }
Day04 >> solvePart1: aString [
	^ self solve: aString withLeadingZeros: 5
]

{ #category : #solution }
Day04 >> solvePart2: aString [
	^ self solve: aString withLeadingZeros: 6
]

{ #category : #'examples - solution' }
Day04 >> solvedPart1 [
	<gtExample>
	^ super solvedPart1
]

{ #category : #'examples - solution' }
Day04 >> solvedPart2 [
	<gtExample>
	^ super solvedPart2
]
