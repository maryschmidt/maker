class @Maker.Models.Project extends Backbone.Model
  urlRoot: '/projects'

  title: ->
    @get('title')

  project_id: ->
    @get('id')

  domId: ->
    @get('dom_id')

  image: ->
    @get('image')

  image_url: ->
    @get('image_url')
