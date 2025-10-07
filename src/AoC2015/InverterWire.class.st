"
I'm an inverter wire.

I take an input and output the logical inverse.
"
Class {
	#name : #InverterWire,
	#superclass : #Wire,
	#category : #'AoC2015-Wires'
}

{ #category : #evaluating }
InverterWire >> moveElectrons: inGraph [
	^ (self input measure: inGraph) bitInvert
]
