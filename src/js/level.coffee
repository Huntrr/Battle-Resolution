$ = require './lib/jquery.js'

module.exports = class Level extends Screen
  constructor: (@background, @page, @player, @opponent) ->
    super @background @page

  load: () ->

  unload: () ->
    super()

