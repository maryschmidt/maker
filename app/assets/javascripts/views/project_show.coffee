class @Maker.Views.ProjectShow extends Backbone.View
  tagName: 'project'

  render: ->
    @$el.template 'projects/show'
    @$el.attr id: @model.domId()
    @$el.find('a').attr("href", Routes.project_path(@model.project_id()))
    @$el.find('img').attr("src", @model.image_url())
    @
