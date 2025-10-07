"
I'm a simple pass-through wire.

I don't provide logic, I just connect things.
"
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
	^ self input measure: inGraph
]
