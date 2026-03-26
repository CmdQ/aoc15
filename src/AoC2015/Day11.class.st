"
I represent day 11 of the Advent of Code 2015 puzzles.

I solve the 'Corporate Policy' problem.
"
Class {
	#name : #Day11,
	#superclass : #Day,
	#category : #AoC2015
}

{ #category : #input }
Day11 >> input [
	<noTest>
	<gtExample>
	^ 'cqjxjnds'
]

{ #category : #'examples - input' }
Day11 >> inputMiddle [
	<gtExample>
	| res |
	res := self solvePart1: 'ghijklmn'.
	self assert: res equals: 'ghjaabcc'.
	^ res
]

{ #category : #'examples - input' }
Day11 >> inputStart [
	<gtExample>
	| res |
	res := self solvePart1: 'abcdefgh'.
	self assert: res equals: 'abcdffaa'.
	^ res
]

{ #category : #solution }
Day11 >> solvePart1: password [
	| current |
	current := Password fromText: password.
	"[ (current := current increment) isValid ] whileFalse."
	^ current asString
]

{ #category : #solution }
Day11 >> solvePart2: aString [
	self shouldBeImplemented
]

{ #category : #'examples - solution' }
Day11 >> solvedPart1 [
	<noTest>
	<gtExample>
	^ super solvedPart1
]

{ #category : #'examples - solution' }
Day11 >> solvedPart2 [
	<noTest>
	<gtExample>
	^ super solvedPart2
]
