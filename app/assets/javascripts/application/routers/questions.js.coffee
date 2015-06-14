class App.Routers.Questions extends App.Router
    routes:
        "questions" : "index",
        "question/:id" : "detail"

    index: ->
        collection = new App.Collections.Questions()
        view = new App.Views.Questions.Index(collection: collection)
        $('body').html(view.$el)
        collection.fetch()
        view.render()

    detail:(id) ->
        # detail of a question
        model = new App.Models.Question({id: id})
        view = new App.Views.Question.Index(model: model)
        $('body').html(view.$el)
        model.fetch()
        view.render()
    
