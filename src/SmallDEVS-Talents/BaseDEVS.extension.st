Extension { #name : #BaseDEVS }

{ #category : #'*SmallDEVS-Talents' }
BaseDEVS >> addTalent: aTalent [

	|resultIntance|
	resultIntance := super addTalent: aTalent.
	resultIntance initializeTrait.
	^ resultIntance 
]
