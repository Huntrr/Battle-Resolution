$ = require './../lib/jquery.js'
Debater = require './../debater.coffee'

# Player class, extends Debater
module.exports = class Player extends Debater
  constructor: (@game, @name = 'PLAYER', @gender = 'boy') ->
    super(@game, false, @name, 1, 3, 'CAPITALIST')
    @img = @gender

  load: () ->
    super()

  say: (what, cb) ->
    @game.console.put(@name + ': ' + what, cb)
