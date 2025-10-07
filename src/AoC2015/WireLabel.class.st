"
I'm a string label.

I take of finding my node in the graph by that name and measuring it.
"
Class {
	#name : #WireLabel,
	#superclass : #Copper,
	#instVars : [
		'name'
	],
	#category : #'AoC2015-Wires'
}

{ #category : #evaluating }
WireLabel >> moveElectrons: inGraph [
	^ (inGraph at: self name) measure: inGraph
]

{ #category : #accessing }
WireLabel >> name [
	^ name
]

{ #category : #accessing }
WireLabel >> name: anObject [
	name := anObject
]
