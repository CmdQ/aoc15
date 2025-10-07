Class {
	#name : #InverterWire,
	#superclass : #Wire,
	#category : #'AoC2015-Wires'
}

{ #category : #evaluating }
InverterWire >> moveElectrons: inGraph [
	^ ((inGraph at: self input) measure: inGraph) bitInvert
]
