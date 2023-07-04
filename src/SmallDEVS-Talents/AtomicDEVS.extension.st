Extension { #name : #AtomicDEVS }

{ #category : #'*SmallDEVS-Talents' }
AtomicDEVS class >> newProcessorWith: aLimit [

	|aDevs|
	aDevs := self class new.
	aDevs addTalent: TAtomicProcessor.
	aDevs queueLimit: aLimit.
	^ aDevs
]
