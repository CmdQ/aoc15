"
I'm the abstract base for all wire classes.

I only provide measuring and the caching of.
"
Class {
	#name : #Copper,
	#superclass : #Object,
	#instVars : [
		'output',
		'cached'
	],
	#category : #'AoC2015-Wires'
}

{ #category : #evaluating }
Copper >> measure: inGraph [
	cached ifNil: [ cached := self moveElectrons: inGraph ].
	^ cached
]

{ #category : #evaluating }
Copper >> moveElectrons: inGraph [
	^ self subclassResponsibility
]
