class @Maker.Routers.Router extends Backbone.Router
  routes:
    projects: "indexProjects"
    # "projects/new": "newProject"

  indexProjects: ->
    projectsCollection = new Maker.Collections.Projects(projectsData)
    projects = new Maker.Views.ProjectsShow({ projects: projectsCollection, el: $('.projects') })
    projects.render()

  # newProject ->
    # form = new Maker.Views.ProjectNewView()
    # form.render()
