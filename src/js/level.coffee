$ = require './lib/jquery.js'
Screen = require './screen.coffee'

module.exports = class Level extends Screen
  constructor: (@game, @player, @opponent) ->
    super @game

  load: () ->
    super()

  unload: () ->
    super()

