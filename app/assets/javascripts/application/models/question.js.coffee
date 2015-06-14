class App.Models.Question extends App.Model
    urlRoot: 'api/questions'

    defaults:
        published: false,
        answers: []

    parse: (response, options) ->
        # ...
        answers_list = new App.Collections.Answers(response.answers)
        response.answers = answers_list

        response

    populateValueAfterSave: (data) ->
        @.set('id', data.id)
        @.set('published', data.published)
        @.set('created_at', data.created_at)
        @.set('updated_at', data.updated_at)
    