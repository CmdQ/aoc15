"
I'm a binary operation wire.

I compute the AND or OR of two inputs.
"
Class {
	#name : #BinaryWire,
	#superclass : #Wire,
	#instVars : [
		'secondInput',
		'combiner'
	],
	#category : #'AoC2015-Wires'
}

{ #category : #accessing }
BinaryWire >> combiner [
	^ combiner
]

{ #category : #accessing }
BinaryWire >> combiner: anObject [
	combiner := anObject
]

{ #category : #'evaluating\t' }
BinaryWire >> moveElectrons: inGraph [
	| second |
	second := self secondInput measure: inGraph.
	^ (self input measure: inGraph)
		perform: self combiner
		withArguments: (Array with: second)
]

{ #category : #accessing }
BinaryWire >> secondInput [
	^ secondInput
]

{ #category : #accessing }
BinaryWire >> secondInput: anObject [
	secondInput := anObject
]
