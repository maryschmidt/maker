class @Maker.Views.ProjectNew extends Backbone.View

  render: ->
    @$el.template 'projects/new'
    @$el.attr id: @model.domId()
    @$el.find('#project_title').attr('name', 'project[#{@model.title()}]')
    @el.find('#project_description').attr('name', 'project[#{@model.description()}]')
    @
