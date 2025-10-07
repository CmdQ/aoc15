Class {
	#name : #WireParser,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'number',
		'arrow',
		'variable',
		'assignment',
		'negate',
		'binary',
		'shift',
		'wire',
		'signal'
	],
	#category : #'AoC2015-Wires'
}

{ #category : #grammar }
WireParser >> arrow [
	^ '->' asPParser trim
]

{ #category : #grammar }
WireParser >> assignment [
	^ (signal / variable , arrow , variable)
		==> [ :a | 
			Wire new
				input: (a at: 1);
				output: (a at: 3);
				yourself ]
]

{ #category : #grammar }
WireParser >> binary [
	^ (variable / signal , ('AND' asPParser / 'OR' asPParser) trim , variable
		, arrow , variable)
		==> [ :a | 
			BinaryWire new
				input: (a at: 1);
				combiner: ((a at: 2) = 'OR' ifTrue: #bitOr: ifFalse: #bitAnd:);
				secondInput: (a at: 3);
				output: (a at: 5);
				yourself ]
]

{ #category : #grammar }
WireParser >> negate [
	^ ('NOT' asPParser trim , variable , arrow , variable)
		==> [ :a | 
			InverterWire new
				input: (a at: 2);
				output: (a at: 4);
				yourself ]
]

{ #category : #grammar }
WireParser >> number [
	^ #digit asPParser plus flatten ==> [ :s | s asInteger ]
]

{ #category : #grammar }
WireParser >> shift [
	^ (variable , ($L asPParser / $R asPParser , 'SHIFT' asPParser) trim , number
		, arrow , variable)
		==> [ :a | 
			ShiftWire new
				input: (a at: 1);
				amount: (a at: 3) asInteger * (((a at: 2) at: 1) = $L ifTrue: 1 ifFalse: -1);
				output: (a at: 5);
				yourself ]
]

{ #category : #grammar }
WireParser >> signal [
	^ number ==> [ :n | Signal new output: n ]
]

{ #category : #accessing }
WireParser >> start [
	^ wire
]

{ #category : #grammar }
WireParser >> variable [
	^ #letter asPParser plus flatten
]

{ #category : #grammar }
WireParser >> wire [
	^ (assignment / negate / binary / shift) end
]
