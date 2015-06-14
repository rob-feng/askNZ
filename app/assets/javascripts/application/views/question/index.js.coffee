class App.Views.Question.Index extends App.View
    template: HandlebarsTemplates['question/index']

    parameters: ->
        model = {
            id: @model.get('id'),
            title: @model.get('title'),
            content: @model.get('body'),
            published: @model.get('published'),
            created: @formatDate(@model.get('created_at'))
            answers: @model.get('answers')
        }

        model

    events: {
        'click #showAnswerBtn' : 'addAnAnswer',
        'submit #answer-form' : 'createAnAnswer',
        'click .btn-answer-cancel' : 'cancelAnswer'
    },

    render: ->
        @$el.html(@template(@parameters()))
        @makeFieldsEditable()
        @renderAnswers(@parameters().answers)

        @

    makeFieldsEditable: ->
        # ...
        @.$el.find($('#title')).editable({
            type: 'text',
            title: 'Title'
        });
        @.$el.find($('#title')).editable();

    renderAnswers:(answers) ->
        # ...
        answersView = new App.Views.Answers.Index({collection: answers})
        $('#answers_area').html(answersView.render().$el)
        

    
    initialize: ->
        @model.on('sync', @render, @)
        super

    remove: ->
        @model.off('sync', @render, @)
        super

    addAnAnswer:(e) ->
        # ...
        @.$el.find('#answer-form').show()

    cancelAnswer :(e) ->
        # ...
        @.$el.find('#answer-form').hide()


    createAnAnswer :(e) ->
        # ...
        answer = new App.Models.Answer()
        answer.set('body', @.$el.find('#answer-form .answerTextArea').val())
        answer.set('question_id', @model.get('id'))
        answer.save()
        @model.add(answer)