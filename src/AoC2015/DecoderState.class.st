Class {
	#name : #DecoderState,
	#superclass : #Object,
	#category : #'AoC2015-Encode-Decode'
}

{ #category : #decoding }
DecoderState >> process: char in: decoder [
	self subclassResponsibility
]
