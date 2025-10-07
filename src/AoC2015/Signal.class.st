Class {
	#name : #Signal,
	#superclass : #Object,
	#instVars : [
		'output',
		'cached'
	],
	#category : #'AoC2015-Wires'
}

{ #category : #evaluating }
Signal >> measure: inGraph [
	cached ifNil: [ cached := self moveElectrons: inGraph ].
	^ cached
]

{ #category : #evaluating }
Signal >> moveElectrons: inGraph [
	^ self output
]

{ #category : #accessing }
Signal >> output [
	^ output
]

{ #category : #accessing }
Signal >> output: anObject [
	output := anObject
]
