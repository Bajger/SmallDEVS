"
Signalized in #eq:. Usefull for debugging:

	[anObject eq: anotherObject] on: NonEqDetected do: [:e | self halt. e resume ] 


"
Class {
	#name : #NonEqDetected,
	#superclass : #Exception,
	#category : #'SmallDEVS-MyRepository-old-SmallDEVS-MyRepository-old'
}

{ #category : #'as yet unclassified' }
NonEqDetected >> defaultAction [
	
]

{ #category : #'as yet unclassified' }
NonEqDetected >> isResumable [
	^true
]
