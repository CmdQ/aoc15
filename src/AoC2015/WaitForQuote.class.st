Class {
	#name : #WaitForQuote,
	#superclass : #DecoderState,
	#category : #'AoC2015-Encode-Decode'
}

{ #category : #decoding }
WaitForQuote >> process: char in: decoder [
	char = $" ifTrue: [ ^ NormalState new ].
	char isSeparator
		ifTrue: [ decoder tallyWhitespace ]
		ifFalse: [ self error: 'unexpected char while waiting for quote' ].
	^ self
]
