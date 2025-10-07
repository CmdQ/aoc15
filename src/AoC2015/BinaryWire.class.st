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
	| hop in2 |
	hop := self input.
	hop isString ifTrue: [ hop := inGraph at: hop ].
	self assert: (hop isKindOf: Signal).
	in2 := (inGraph at: self secondInput) measure: inGraph.
	^ (hop measure: inGraph)
		perform: self combiner
		withArguments: (Array with: in2)
]

{ #category : #accessing }
BinaryWire >> secondInput [
	^ secondInput
]

{ #category : #accessing }
BinaryWire >> secondInput: anObject [
	secondInput := anObject
]
