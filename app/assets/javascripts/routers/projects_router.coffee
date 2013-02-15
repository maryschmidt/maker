class @Maker.Routers.ProjectsRouter extends Backbone.Router
  routes:
    ""    : "indexProjects"
    "new" : "newProject"

  initialize: ->
    projectsData = Maker.bootstrap('projects')
    @projectsCollection = new Maker.Collections.Projects(projectsData)
    Backbone.history.start(root: '/projects', pushState: true)

  indexProjects: =>
    projects = new Maker.Views.ProjectsShow({ projects: @projectsCollection, el: $('.projects') })
    projects.render()

  newProject: =>
    project = new Maker.Views.ProjectNew()
    project.render()
