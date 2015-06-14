class App.Models.Answer extends App.Model
    urlRoot: 'api/answers'

    defaults: ->
        agree: Math.floor(Math.random() * (100 -10)) + 10
        disagree: Math.floor(Math.random() * (50 -5)) + 5

    