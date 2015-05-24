$ = require './../lib/jquery.js'
Screen = require './../screen.coffee'

module.exports = class Oak extends Screen
  constructor: (@game) ->
    super @game

  load: () ->
    super()
    @game.opponentElem.show()
    @game.console.show()

  unload: () ->
    super()
