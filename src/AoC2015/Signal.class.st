"
I'm not really a wire, I provide a number signal on them.
"
Class {
	#name : #Signal,
	#superclass : #Copper,
	#category : #'AoC2015-Wires'
}

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
