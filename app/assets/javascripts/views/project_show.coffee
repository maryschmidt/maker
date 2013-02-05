class @Maker.Views.ProjectShow extends Backbone.View
  tagName: 'article'

  render: ->
    @$el.template 'projects/show'
    @$el.attr id: @model.domId()
    @$el.find('h2').text @model.title()
    @
