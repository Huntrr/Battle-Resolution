$ = require 'lib/jquery.js'
Debater = require './../debater.coffee'

# Basic debater class. Controls an actor in the game
module.exports = class Novice extends Debater
  constructor: (@game) ->
    super(@game, true, 'NOVICE', 1, 2, 'CUPCAKE')

    # set basic statis
    # ALREADY SET (constructed)
    # @case (HP)
    # @level (speaker score) (Lvl)
    # @type (type)
    @clash = 1 # ATTACK
    @presentation = 2 # SP. ATTACK
    @organization = 0 # SPEED
    @civility = 6 # Totally arbitrary
    @cross = 1 # DEFENCE

    Gaff = require 'moves/gaff.coffee'
    @addMove(new Gaff())
