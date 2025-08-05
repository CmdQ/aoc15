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
	^ ' |res|res:= {1}.self assert:res equals: {2}.^res' format: anArray
]

{ #category : #'code generation' }
Template class >> createDay: anInteger description: aString examples: examplesArray [
	| className newClass complexBody |
	className := 'Day' , (anInteger printPaddedWith: $0 to: 2).
	(Smalltalk hasClassNamed: className)
		ifTrue: [ (Smalltalk classNamed: className) removeFromSystem ].
	newClass := (Object
			subclass: className asSymbol
			instanceVariableNames: ''
			classVariableNames: ''
			package: 'AoC2015')
			classComment: (self createDescription: aString forDay: anInteger).
	newClass compile: 'input<gtExample>^''''' classified: 'input'.
	newClass compile: 'solvePart1: aString' classified: 'solution'.
	newClass compile: 'solvePart2: aString' classified: 'solution'.
	complexBody := 'solvedPart1<gtExample>'
			, (self
					createCodeBody: {'self solvePart1: self input'.
							nil}).
	newClass compile: complexBody classified: 'examples - solution'.
	newClass compile: (complexBody copyReplaceAll: 'Part1' with: 'Part2') classified: 'examples - solution'.
	examplesArray
		do: [ :assoc | newClass compile: (self createCode: assoc) classified: 'examples - input' ].
	newClass class methods do: [ :method | method reformat ].
	newClass methods do: [ :method | method reformat ].
	^ newClass
]

{ #category : #'code generation' }
Template class >> createDescription: aString forDay: anInteger [
	^ 'I represent day {2} of the Advent of Code 2015 puzzles.

I solve the ''{1}'' problem.'
		format: {aString.
				anInteger}
]
