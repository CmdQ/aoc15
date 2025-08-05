"
I represent day 4 of the Advent of Code 2015 puzzles.

I solve the 'The Ideal Stocking Stuffer' problem.
"
Class {
	#name : #Day04,
	#superclass : #Day,
	#category : #AoC2015
}

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

{ #category : #solution }
Day04 >> solvePart1: aString [
	self shouldBeImplemented
]

{ #category : #solution }
Day04 >> solvePart2: aString [
	self shouldBeImplemented
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
