"
I represent day 9 of the Advent of Code 2015 puzzles.

I solve the 'All in a Single Night' problem.
"
Class {
	#name : #Day09,
	#superclass : #Day,
	#instVars : [
		'nodes',
		'edges'
	],
	#category : #AoC2015
}

{ #category : #expecting }
Day09 >> answer1 [
	^ 117
]

{ #category : #'as yet unclassified' }
Day09 >> answer2 [
	^ 909
]

{ #category : #solution }
Day09 >> distance: cities [
	^ (cities
		overlappingPairsCollect: [ :a :b | 
			edges
				at: ('-'
						join: (a <= b
								ifTrue: {a.
										b}
								ifFalse: {b.
										a})) ]) sum
]

{ #category : #'input\t' }
Day09 >> input [
	^ 'Faerun to Tristram = 65
Faerun to Tambi = 129
Faerun to Norrath = 144
Faerun to Snowdin = 71
Faerun to Straylight = 137
Faerun to AlphaCentauri = 3
Faerun to Arbre = 149
Tristram to Tambi = 63
Tristram to Norrath = 4
Tristram to Snowdin = 105
Tristram to Straylight = 125
Tristram to AlphaCentauri = 55
Tristram to Arbre = 14
Tambi to Norrath = 68
Tambi to Snowdin = 52
Tambi to Straylight = 65
Tambi to AlphaCentauri = 22
Tambi to Arbre = 143
Norrath to Snowdin = 8
Norrath to Straylight = 23
Norrath to AlphaCentauri = 136
Norrath to Arbre = 115
Snowdin to Straylight = 101
Snowdin to AlphaCentauri = 84
Snowdin to Arbre = 96
Straylight to AlphaCentauri = 107
Straylight to Arbre = 14
AlphaCentauri to Arbre = 46'
]

{ #category : #'examples - input' }
Day09 >> inputexample [
	<gtExample>
	| res |
	res := self
			solvePart1: 'London to Dublin = 464
London to Belfast = 518
Dublin to Belfast = 141'.
	self assert: res equals: 605.
	^ res
]

{ #category : #solution }
Day09 >> makeGraph: aString [
	| cities |
	cities := Set new.
	edges := Dictionary new.
	aString lines
		do: [ :l | 
			| split dist |
			split := l findTokens: ' ='.
			split removeAt: 2.
			dist := split removeAt: 3.
			cities add: (split at: 1).
			cities add: (split at: 2).
			split sort.
			edges at: ('-' join: split) put: dist asInteger ].
	nodes := cities asOrderedCollection
]

{ #category : #solution }
Day09 >> solvePart1: aString [
	^ self solvePart: aString cmp: #<
]

{ #category : #solution }
Day09 >> solvePart2: aString [
	^ self solvePart: aString cmp: #>
]

{ #category : #solution }
Day09 >> solvePart: aString cmp: msg [
	| best minMax |
	self makeGraph: aString.
	minMax := self distance: nodes.
	best := nodes copy.
	nodes
		permutationsDo: [ :p | 
			| cur |
			cur := self distance: p.
			(cur perform: msg with: minMax)
				ifTrue: [ minMax := cur.
					best := p copy ] ].
	^ minMax
]

{ #category : #'examples - solution' }
Day09 >> solvedPart1 [
	<gtExample>
	^ super solvedPart1
]

{ #category : #'examples - solution' }
Day09 >> solvedPart2 [
	<gtExample>
	^ super solvedPart2
]
