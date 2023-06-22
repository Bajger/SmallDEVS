Extension { #name : #Float }

{ #category : #'*SmallDEVS-Core-old' }
Float >> storeOn: aStream [

	self = Infinity
		ifTrue: [ aStream nextPutAll: '(Float infinity)' ] 
		ifFalse: [ super storeOn: aStream ]
]
