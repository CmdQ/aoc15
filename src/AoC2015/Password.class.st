Class {
	#name : #Password,
	#superclass : #Object,
	#instVars : [
		'letters'
	],
	#category : #'AoC2015-Passwords'
}

{ #category : #checking }
Password class >> badIOL [
	^ #(8 11 14)
]

{ #category : #'instance creation' }
Password class >> fromText: password [
	^ self new
		letters: (password collect: [ :c | c asciiValue - 97 ] as: ByteArray) reversed
]

{ #category : #printing }
Password >> asString [
	^ self letters reversed
		collect: [ :e | (e + 97) asCharacter ]
		as: String
]

{ #category : #solution }
Password >> has2repeating [
	| diffs chars lastZero |
	diffs := OrderedCollection new.
	chars := self letters.
	2 to: 8 do: [ :i | diffs add: (chars at: i - 1) - (chars at: i) ].
	lastZero := 0.
	diffs
		doWithIndex: [ :each :index | 
			each = 0
				ifTrue: [ (lastZero > 0 and: [ index - lastZero > 1 ]) ifTrue: [ ^ true ].
					lastZero := index ] ].
	^ false
]

{ #category : #modifying }
Password >> increment [
]

{ #category : #checking }
Password >> isValid [
	(self class badIOL anySatisfy: [ :c | self letters includes: c ])
		ifTrue: [ ^ false ].
	^ true
]

{ #category : #accessing }
Password >> letters [
	^ letters
]

{ #category : #accessing }
Password >> letters: anObject [
	letters := anObject
]
