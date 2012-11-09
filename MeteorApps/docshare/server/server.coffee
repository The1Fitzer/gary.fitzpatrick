Meteor.startup ->
	if Documents.find().count() is 0
		Documents.insert
			name: "Sample Doc"
			text: "Write here..."