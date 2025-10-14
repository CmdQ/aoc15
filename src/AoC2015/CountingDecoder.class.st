Class {
	#name : #CountingDecoder,
	#superclass : #Object,
	#instVars : [
		'state',
		'chars',
		'ws',
		'len'
	],
	#category : #'AoC2015-Encode-Decode'
}

{ #category : #accessing }
CountingDecoder >> checkInvariant [
	(state isKindOf: WaitForQuote)
		ifFalse: [ self error: 'ended without final quote' ]
]

{ #category : #initialization }
CountingDecoder >> initialize [
	super initialize.
	len := chars := ws := 0.
	state := WaitForQuote new
]

{ #category : #accessing }
CountingDecoder >> length [
	self checkInvariant.
	^ len - ws
]

{ #category : #decoding }
CountingDecoder >> process: char [
	len := len + 1.
	state := state process: char in: self
]

{ #category : #counting }
CountingDecoder >> tallyContent [
	chars := chars + 1
]

{ #category : #counting }
CountingDecoder >> tallyWhitespace [
	ws := ws + 1
]

{ #category : #accessing }
CountingDecoder >> validChars [
	self checkInvariant.
	^ chars
]
