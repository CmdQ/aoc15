Class {
	#name : #BaselineOfAoC2015,
	#superclass : #BaselineOf,
	#category : #BaselineOfAoC2015
}

{ #category : #loading }
BaselineOfAoC2015 class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = '15' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfAoC2015 >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'AoC2015'
		]
]
