$ = require 'lib/jquery.js'
Debater = require './../debater.coffee'

# Basic debater class. Controls an actor in the game
module.exports = class Novice extends Debater
  constructor: (@game) ->
    super(@game, true, 'RON PAUL', 5, 4, 'RONNY')

    # set basic statis
    # ALREADY SET (constructed)
    # @case (HP)
    # @level (speaker score) (Lvl)
    # @type (type)
    @clash = 5 # ATTACK
    @presentation = 3 # SP. ATTACK
    @organization = 5 # SPEED
    @civility = 9001 # Totally arbitrary
    @cross = 2 # DEFENCE

    @addMoveByClass require 'moves/run-for-pres.coffee'
