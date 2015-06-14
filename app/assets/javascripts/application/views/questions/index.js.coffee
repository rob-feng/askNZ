class App.Views.Questions.Index extends App.View
	template: HandlebarsTemplates['questions/index']
	events : {
		"submit #question-create-form" : "handleNewQuestionCreate"
	},
	parameters: ->
		@collection.map (model) ->
			title: model.get('title'),
			published: model.get('published'),
			id: model.get('id'),
			answersCount : model.get('answers').length

	render: ->
		@$el.html(@template(@parameters()))

		@

	initialize: ->
		@collection.on('sync', @render, @)
		@collection.on('add', @render, @)
		super

	remove: ->
		@collection.off('sync', @render, @)
		@collection.off('add', @render, @)
		super

	handleNewQuestionCreate: (e) ->
		self = @
		e.preventDefault()
		title = @.$el.find('#question-form-title').val()
		content = @.$el.find('#question-form-content').val()

		model = new App.Models.Question()
		model.set('title', title)
		model.set('body', content)
		model.set('published', true)

		model.save().done((data) ->
			model.populateValueAfterSave(data)
			self.collection.add(model)
		)
		
