Class {
	#name : #Wire,
	#superclass : #Signal,
	#traits : 'TEquality',
	#classTraits : 'TEquality classTrait',
	#instVars : [
		'input'
	],
	#category : #'AoC2015-Wires'
}

{ #category : #accessing }
Wire >> input [
	^ input
]

{ #category : #accessing }
Wire >> input: anObject [
	input := anObject
]

{ #category : #evaluating }
Wire >> moveElectrons: inGraph [
	| hop |
	hop := self input.
	hop isString ifTrue: [ hop := inGraph at: hop ].
	^ hop measure: inGraph
]
