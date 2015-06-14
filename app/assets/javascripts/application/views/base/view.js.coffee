class App.View extends Backbone.View
    formatDate:(dateString) ->
        # format date
        if typeof dateString != 'undefined'
            myDate = moment(dateString);
            return myDate.format('dddd, MMMM Do YYYY');
        else
            return '0000-00-00'

_.extend App.View, App.Mixins