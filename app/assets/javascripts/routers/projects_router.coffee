class @Maker.Routers.ProjectsRouter extends Backbone.Router
  routes:
    "" : "indexProjects"
    # "new": "newProject"

  indexProjects: ->
    projectsData = Maker.bootstrap('projects')
    projectsCollection = new Maker.Collections.Projects(projectsData)
    projects = new Maker.Views.ProjectsShow({ projects: projectsCollection, el: $('.projects') })
    projects.render()

  # newProject ->
    # form = new Maker.Views.ProjectNewView()
    # form.render()
