$ = require 'lib/jquery.js'
Debater = require './../debater.coffee'

# Basic debater class. Controls an actor in the game
module.exports = class ParentJudge extends Debater
  constructor: (@game) ->
    super(@game, true, 'PARENT JUDGE', 8, 5, 'PARENT')

    # set basic statis
    # ALREADY SET (constructed)
    # @case (HP)
    # @level (speaker score) (Lvl)
    # @type (type)
    @clash = 3 # ATTACK
    @presentation = 2 # SP. ATTACK
    @organization = 3 # SPEED
    @civility = 6 # Totally arbitrary
    @cross = 1 # DEFENCE

    @addMoveByClass require 'moves/shout.coffee'
    @addMoveByClass require 'moves/mess-up-flow.coffee'
