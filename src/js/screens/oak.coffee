$ = require './../lib/jquery.js'
Screen = require './../screen.coffee'
Debater = require './../debater.coffee'

module.exports = class Oak extends Screen
  constructor: (@game) ->
    super @game

  load: () ->
    super()
    @game.setOpponent(new Debater(@game, true, 'SMITH', 31, 6, 'COACH'))
    @game.opponentElem.show()
    @game.console.show()

    @game.opponent.say('Hello!', (err) -> h = true)

  unload: () ->
    super()
