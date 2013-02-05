class @Maker.Models.Project extends Backbone.Model
  title: ->
    @get('title')

  domId: ->
    @get('dom_id')
