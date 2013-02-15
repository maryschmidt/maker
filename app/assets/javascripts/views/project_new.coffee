class @Maker.Views.ProjectNew extends Backbone.View

  events: ->
    "click .actions": "submit"

  render: ->
    @$el.template 'projects/new'
    @$el.find('.button a').attr('href', Routes.dashboard_projects_path())
    $('.container').append(@$el)
    @

  submit: ->
    attributes = new FormAttributes(@$('form')).attributes()
    console.log attributes
    self = @
    project = new Maker.Models.Project(attributes).save()

    return false
