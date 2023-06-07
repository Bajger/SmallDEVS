Class {
	#name : #BaselineOfSmallDEVS,
	#superclass : #BaselineOf,
	#category : #BaselineOfSmallDEVS
}

{ #category : #baselines }
BaselineOfSmallDEVS >> baseline: spec [
	<baseline>
	
	spec for: #'common' do: [
			
		spec 
			package: 'SmallDEVS-Core';
			package: 'SmallDEVS-Tests'.
		spec 
			group: 'Core' with: #('SmallDEVS-Core');
			group: 'Tests' with: #('SmallDEVS-Tests');
			group: 'default' with: #('Core' 'Tests') ]
]
