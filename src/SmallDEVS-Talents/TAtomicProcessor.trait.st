"
I represent a traits for Atomic DEVS processor, that is added as talent (instance specific trait) to base AtomicDEVS instance.
"
Trait {
	#name : #TAtomicProcessor,
	#instVars : [
		'queue',
		'queueLimit',
		'processorStatus',
		'currentJob',
		'timeSpent'
	],
	#category : #'SmallDEVS-Talents'
}

{ #category : #private }
TAtomicProcessor >> evaluateProcessorStatusWith: statusHandle [

	|aBlock|
	aBlock := statusHandle at: processorStatus ifAbsent: [ (self error: 'Unknown processor state: {1}.') format: { processorStatus } ].
	^ aBlock value
]

{ #category : #'model definition' }
TAtomicProcessor >> extTransition [

	| job statusHandle|

	job := self peekFrom: #in.
	queue add: job.

	statusHandle := { 
		#idle -> [ 
			processorStatus := #busy.
			currentJob := queue removeFirst
		].
		#busy -> [ 	
			timeSpent := timeSpent + self elapsed.
			queue size > queueLimit ifTrue: [ processorStatus := #discard ] 	
		].
		#discard -> [ 
			"do nothing"
		]
	 } asDictionary.
	 self evaluateProcessorStatusWith: statusHandle.
]

{ #category : #'model definition' }
TAtomicProcessor >> initializeTrait [

	queue := OrderedCollection new.
	queueLimit := 0.
	processorStatus := #idle.
	currentJob := nil.
	timeSpent := 0.
	self addInputPortNamed: #in.
	self addOutputPortNamed: #out.
	self addOutputPortNamed: #discard.
]

{ #category : #'model definition' }
TAtomicProcessor >> intTransition [
	|statusHandle|
	statusHandle := {
		#busy -> [
			queue size isEmpty
			ifFalse: [ currentJob := queue removeFirst ]
			ifTrue: [ 
				processorStatus := #idle.
				currentJob := nil 
			].
			timeSpent := 0 
		].

		#discard -> [
			queue removeFirst.
			queue size <= queueLimit 
				ifTrue: [ processorStatus := #busy ]
		].

		#idle -> [ "nothing" ].
	} asDictionary.
	self evaluateProcessorStatusWith: statusHandle
]

{ #category : #private }
TAtomicProcessor >> queueLimit: aLimit [
	
	queueLimit := aLimit
]

{ #category : #'model definition' }
TAtomicProcessor >> timeAdvance [
	|statusHandle|
	statusHandle := {
		#busy	-> [ currentJob size - timeSpent ].
		#discard 	-> [ 0 ].
		#idle -> [ Float infinity ].
	} asDictionary.
	^ self evaluateProcessorStatusWith: statusHandle.
]
