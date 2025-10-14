Class {
	#name : #EscapingState,
	#superclass : #DecoderState,
	#instVars : [
		'skip'
	],
	#category : #'AoC2015-Encode-Decode'
}

{ #category : #decoding }
EscapingState >> process: char in: decoder [
	('"\' includes: char)
		ifTrue: [ decoder tallyContent.
			^ NormalState new ].
	char = $x
		ifTrue: [ skip := 2.
			^ self ].
	skip := skip - 1.
	skip = 0
		ifTrue: [ decoder tallyContent.
			^ NormalState new ]
		ifFalse: [ ^ self ]
]
