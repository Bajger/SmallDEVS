"
I'm superclass for all DEVS models. I know my name and how to serialize myself into STON format.
"
Class {
	#name : #PhDEVSEntity,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'SmallDEVS-Core'
}

{ #category : #accessing }
PhDEVSEntity >> name [

	^ name
]

{ #category : #accessing }
PhDEVSEntity >> name: anObject [

	name := anObject
]

{ #category : #'ston persistence' }
PhDEVSEntity >> stonOn: stonWriter [
	"This is just for convenience to export DEVS entity into STON format, can be removed if no extra logic is needed"

	stonWriter writeObject: self
]
