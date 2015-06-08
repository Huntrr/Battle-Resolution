$ = require 'lib/jquery.js'
Debater = require './../debater.coffee'

# Basic debater class. Controls an actor in the game
module.exports = class ParentJudge extends Debater
  constructor: (@game) ->
    super(@game, true, 'Parent', 8, 5, 'PARENT')

    # set basic statis
    # ALREADY SET (constructed)
    # @case (HP)
    # @level (speaker score) (Lvl)
    # @type (type)
    @clash = 4 # ATTACK
    @presentation = 6 # SP. ATTACK
    @organization = 4 # SPEED
    @civility = 6 # Totally arbitrary
    @cross = 3 # DEFENCE

    @addMoveByClass require 'moves/shout.coffee'
    @addMoveByClass require 'moves/mess-up-flow.coffee'
