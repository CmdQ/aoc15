"
I'm a shift wire.

I take an input and shift it to the left or the right.
"
Class {
	#name : #ShiftWire,
	#superclass : #Wire,
	#instVars : [
		'amount'
	],
	#category : #'AoC2015-Wires'
}

{ #category : #accessing }
ShiftWire >> amount [
	^ amount
]

{ #category : #accessing }
ShiftWire >> amount: anObject [
	amount := anObject
]

{ #category : #evaluating }
ShiftWire >> moveElectrons: inGraph [
	^ (self input measure: inGraph) bitShift: self amount
]
