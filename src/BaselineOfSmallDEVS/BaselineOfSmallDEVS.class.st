Class {
	#name : #BaselineOfSmallDEVS,
	#superclass : #BaselineOf,
	#category : #BaselineOfSmallDEVS
}

{ #category : #baselines }
BaselineOfSmallDEVS >> baseline: spec [
	<baseline>
	
	spec for: #'common' do: [
		self setupExternalDependencies: spec.
		spec 
			package: 'SmallDEVS-Repository';
			package: 'SmallDEVS-Core' with: [spec requires: #('SmallDEVS-Repository' 'Talents')];
			package: 'SmallDEVS-Tests' with: [spec requires: #('SmallDEVS-Core')];
			package: 'SmallDEVS-MyRepository-old';
			package: 'SmallDEVS-Core-old' with: [spec requires: #('SmallDEVS-MyRepository-old')];
			package: 'SmallDEVS-Talents' with: [ spec requires: #('SmallDEVS-Core' 'SmallDEVS-Core-old' 'Talents') ].
		spec 
			group: 'Core' with: #('SmallDEVS-Core' 'SmallDEVS-Core-old');
			group: 'Tests' with: #('SmallDEVS-Tests');
			group: 'default' with: #('Core' 'Tests' 'Talents') ]
]

{ #category : #baselines }
BaselineOfSmallDEVS >> setupExternalDependencies: spec [

	"Loads Talents - traits installed on any object instance (not just class)"
	spec baseline: 'Talents'
	with: [ spec repository: 'github://pharo-contributions/pharo-talents/src' ]
]
