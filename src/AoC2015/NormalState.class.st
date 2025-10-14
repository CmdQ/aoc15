Class {
	#name : #NormalState,
	#superclass : #DecoderState,
	#category : #'AoC2015-Encode-Decode'
}

{ #category : #decoding }
NormalState >> process: char in: decoder [
	char = $\ ifTrue: [ ^ EscapingState new ].
	char = $" ifTrue: [ ^ WaitForQuote new ].
	char isSeparator
		ifTrue: [ decoder tallyWhitespace ]
		ifFalse: [ decoder tallyContent ].
	^ self
]
