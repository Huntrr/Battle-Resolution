$ = require 'lib/jquery.js'
Debater = require './../debater.coffee'

# Alyssa Bilinski
module.exports = class Xi extends Debater
  constructor: (@game) ->
    super(@game, true, 'XI JINPING', 25, 6, 'GENERAL SECRETARY')

    # THESE STATS MIGHT NEED TO BE TWEAKED
    # DEPENDING ON HOW POWERFUL THE PLAYER
    # IS OR ISN'T AFTER THE OTHER LEVELS...

    # set basic statis
    # ALREADY SET (constructed)
    # @case (HP)
    # @level (speaker score) (Lvl)
    # @type (type)
    @clash = 4 # ATTACK
    @presentation = 6 # SP. ATTACK
    @organization = 3 # SPEED
    @civility = 0 # Totally arbitrary
    @cross = 6 # DEFENCE

    @addMoveByClass require 'moves/shout.coffee'
    @addMoveByClass require 'moves/corruption.coffee'
    @addMoveByClass require 'moves/communism.coffee'
