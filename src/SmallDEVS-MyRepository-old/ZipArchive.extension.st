Extension { #name : #ZipArchive }

{ #category : #'*SmallDEVS-MyRepository-old' }
ZipArchive >> addCompressedString: aString as: aFileName [
	| newMember |
	newMember := ZipNewFileMember new fromString: aString.
	self addMember: newMember.
	newMember localFileName: aFileName.
	^newMember
]
