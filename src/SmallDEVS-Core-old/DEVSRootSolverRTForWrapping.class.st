Class {
	#name : #DEVSRootSolverRTForWrapping,
	#superclass : #DEVSRootSolverRT,
	#category : #'SmallDEVS-Core-old-Wrapping'
}

{ #category : #'as yet unclassified' }
DEVSRootSolverRTForWrapping >> simulationStep [

	super simulationStep.
	parent signalStateEvent. "Indicate end of step of the wrapper. Its intTransition will react."

]
