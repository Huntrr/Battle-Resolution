$ = require 'lib/jquery.js'
Debater = require './../debater.coffee'

# Alyssa Bilinski
module.exports = class Alyssa extends Debater
  constructor: (@game) ->
    super(@game, true, 'ALYSSA BILINSKI', 25, 6, 'CLEAN WATER COMMIE')

    # THESE STATS MIGHT NEED TO BE TWEAKED
    # DEPENDING ON HOW POWERFUL THE PLAYER
    # IS OR ISN'T AFTER THE OTHER LEVELS...

    # set basic statis
    # ALREADY SET (constructed)
    # @case (HP)
    # @level (speaker score) (Lvl)
    # @type (type)
    @clash = 4 # ATTACK
    @presentation = 5 # SP. ATTACK
    @organization = 4 # SPEED
    @civility = 8 # Totally arbitrary
    @cross = 3 # DEFENCE

    @addMoveByClass require 'moves/bake-cookies.coffee'
    @addMoveByClass require 'moves/save-world.coffee'
    @addMoveByClass require 'moves/clash.coffee'
    @addMoveByClass require 'moves/rebuild.coffee'
    @addMoveByClass require 'moves/assert.coffee'
