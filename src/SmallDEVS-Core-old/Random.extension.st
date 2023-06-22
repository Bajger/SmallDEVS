Extension { #name : #Random }

{ #category : #'*SmallDEVS-Core-old' }
Random >> = anObject [

	^ anObject class = self class and: [ seed = anObject seed ]
]
