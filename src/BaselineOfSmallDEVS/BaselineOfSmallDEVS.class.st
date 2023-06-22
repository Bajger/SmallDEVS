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
			package: 'SmallDEVS-Repository';
			package: 'SmallDEVS-Core' with: [spec requires: #('SmallDEVS-Repository')];
			package: 'SmallDEVS-Tests' with: [spec requires: #('SmallDEVS-Core')];
			package: 'SmallDEVS-MyRepository-old';
			package: 'SmallDEVS-Core-old' with: [spec requires: #('SmallDEVS-MyRepository-old')].
		spec 
			group: 'Core' with: #('SmallDEVS-Core' 'SmallDEVS-Core-old');
			group: 'Tests' with: #('SmallDEVS-Tests');
			group: 'default' with: #('Core' 'Tests') ]
]
