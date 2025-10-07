"
I'm the abstract base class to derive day classes from.

I provide overridable methods for returning the answers, wire up passing the input to the solve functions and hoving both as examples.
"
Class {
	#name : #Day,
	#superclass : #Object,
	#category : #AoC2015
}

{ #category : #expecting }
Day >> answer1 [
	^ nil
]

{ #category : #expecting }
Day >> answer2 [
	^ nil
]

{ #category : #input }
Day >> input [
	self subclassResponsibility
]

{ #category : #solution }
Day >> solvePart1: aString [
	self subclassResponsibility
]

{ #category : #solution }
Day >> solvePart2: aString [
	self subclassResponsibility
]

{ #category : #'examples - solution' }
Day >> solvedPart1 [
	| res |
	res := self solvePart1: self input.
	self assert: res equals: self answer1.
	^ res
]

{ #category : #'examples - solution' }
Day >> solvedPart2 [
	| res |
	res := self solvePart2: self input.
	self assert: res equals: self answer2.
	^ res
]
