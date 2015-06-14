class App.Views.Answers.Index extends App.View
    template: HandlebarsTemplates['answers/index']

    events: {
        "click .agree" : "handleAgree"
        "click .disagree" : "handleDisagree"
    }

    parameters: ->
        @collection.map (model) ->
            title: model.get('title')
            content: model.get('body')
            id: model.get('id')
            agree: model.get('agree')
            disagree: model.get('disagree')

    render: ->
        @$el.html(@template(@parameters()))

        @

    handleAgree: (e) ->
        # ...
        e.preventDefault()
        # add count 
        
        #render 


    handleDisagree: (e) ->
        # ...
        e.preventDefault()
    
    
    
    

