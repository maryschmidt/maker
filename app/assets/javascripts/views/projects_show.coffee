class @Maker.Views.ProjectsShow extends Support.CompositeView
  render: ->
    @options.projects.each (project) =>
      view = new Maker.Views.ProjectShow(model: project)
      @renderChild view
      @$el.append view.el

    @
