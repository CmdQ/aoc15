"
I'm a day-creating template.

I provide examples to show in Lepiter pages through which you can create new puzzles.
"
Class {
	#name : #Template,
	#superclass : #Object,
	#category : #AoC2015
}

{ #category : #'code generation' }
Template class >> createCode: anArray [
	^ ('input{1}<gtExample>' format: {anArray at: 1})
		, (self
				createCodeBody: {'''' , (anArray at: 2) , ''''.
						anArray at: 3})
]

{ #category : #'code generation' }
Template class >> createCodeBody: anArray [
	^ ' |res|res:= self solvePart1: {1}.self assert:res equals: {2}.^res' format: anArray
]

{ #category : #'code generation' }
Template class >> createDay: anInteger withDescription: aString [
	^ self
		createDay: anInteger
		withDescription: aString
		examples: #()
		andInput: ''
]

{ #category : #'code generation' }
Template class >> createDay: anInteger withDescription: aString andExamples: examplesArray [
	^ self
		createDay: anInteger
		withDescription: aString
		examples: examplesArray
		andInput: ''
]

{ #category : #'code generation' }
Template class >> createDay: anInteger withDescription: aString andInput: input [
	^ self
		createDay: anInteger
		withDescription: aString
		examples: #()
		andInput: input
]

{ #category : #'code generation' }
Template class >> createDay: anInteger withDescription: aString examples: examplesArray andInput: input [
	| newClass |
	newClass := self createDayClass: anInteger description: aString.
	self createSimpleMethods: newClass.
	input
		ifNotEmpty: [ newClass compile: ('input ^ ''{1}''' format: {input}) classified: 'input' ].
	examplesArray
		do: [ :assoc | newClass compile: (self createCode: assoc) classified: 'examples - input' ].
	self formatClass: newClass.
	^ newClass
]

{ #category : #'code generation' }
Template class >> createDayClass: anInteger description: aString [
	| className |
	className := 'Day' , (anInteger printPaddedWith: $0 to: 2).
	(Smalltalk hasClassNamed: className)
		ifTrue: [ (Smalltalk classNamed: className) removeFromSystem ].
	^ (Day
		subclass: className asSymbol
		instanceVariableNames: ''
		classVariableNames: ''
		package: 'AoC2015')
		classComment: (self createDescription: aString forDay: anInteger)
]

{ #category : #'code generation' }
Template class >> createDescription: aString forDay: anInteger [
	^ 'I represent day {2} of the Advent of Code 2015 puzzles.

I solve the ''{1}'' problem.'
		format: {aString.
				anInteger}
]

{ #category : #'code generation' }
Template class >> createSimpleMethods: newClass [
	newClass
		compile: 'solvePart1: aString self shouldBeImplemented'
		classified: 'solution'.
	newClass
		compile: 'solvePart2: aString self shouldBeImplemented'
		classified: 'solution'.
	newClass
		compile: 'solvedPart1<gtExample>^super solvedPart1'
		classified: 'examples - solution'.
	newClass
		compile: 'solvedPart2<gtExample>^super solvedPart2'
		classified: 'examples - solution'
]

{ #category : #'examples - snippet' }
Template class >> dayWithDescription [
	<gtExample>
	| re |
	re := self createDay: 7 withDescription: 'Some Assembly Required'.
	^ re
]

{ #category : #'examples - snippet' }
Template class >> dayWithExamples [
	<gtExample>
	| re |
	re := self
			createDay: 9
			withDescription: 'All in a Single Night'
			andExamples: #(#(#example 'London to Dublin = 464
London to Belfast = 518
Dublin to Belfast = 141' 605)).
	^ re
]

{ #category : #'examples - snippet' }
Template class >> dayWithExamplesAndInput [
	<gtExample>
	| re |
	re := self
			createDay: 10
			withDescription: 'Elves Look, Elves Say'
			examples: #(#($1 '1' 11) #($2 '11' 21) #($3 '21' 1211) #($4 '1211' 111221) #($5 '111221' 312211))
			andInput: '1113222113'.
	^ re
]

{ #category : #formatting }
Template class >> formatClass: newClass [
	newClass class methods do: [ :method | method reformat ].
	newClass methods do: [ :method | method reformat ]
]
