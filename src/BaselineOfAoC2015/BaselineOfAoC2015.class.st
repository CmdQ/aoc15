Class {
	#name : #BaselineOfAoC2015,
	#superclass : #BaselineOf,
	#category : #BaselineOfAoC2015
}

{ #category : #loading }
BaselineOfAoC2015 class >> loadLepiter [
	IceRepository registry
		detect: [ :aRepository | aRepository name = 'aoc15' ]
		ifFound: [ :aRepository | 
			| db props |
			db := LeDatabasesRegistry defaultLogicalDatabase.
			props := db properties.
			props addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			db reload.
			^ db pageNamed: 'Advent of Code 2015' ]
		ifNone: [ self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfAoC2015 >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'AoC2015'
		]
]
