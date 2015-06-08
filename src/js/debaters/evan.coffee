$ = require 'lib/jquery.js'
Debater = require './../debater.coffee'

# The final boss
module.exports = class Evan extends Debater
  constructor: (@game) ->
    super(@game, true, 'EVAN STREAMS', 31, 7, 'EX-PAT')

    # set basic statis
    # ALREADY SET (constructed)
    # @case (HP)
    # @level (speaker score) (Lvl)
    # @type (type)
    @clash = 5 # ATTACK
    @presentation = 5 # SP. ATTACK
    @organization = 7 # SPEED
    @civility = 6 # Totally arbitrary
    @cross = 5 # DEFENCE

    @addMoveByClass require 'moves/flee.coffee'
    @addMoveByClass require 'moves/assert.coffee'
    @addMoveByClass require 'moves/announce.coffee'
