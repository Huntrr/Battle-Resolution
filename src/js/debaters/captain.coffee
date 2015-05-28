$ = require 'lib/jquery.js'
Debater = require './../debater.coffee'

# Basic debater class. Controls an actor in the game
module.exports = class Captain extends Debater
  constructor: (@game) ->
    super(@game, true, 'YOUR CAPTAIN', 7, 4, 'Superintendent? More like SUPER COMMUNIST!')

    # set basic statis
    # ALREADY SET (constructed)
    # @case (HP)
    # @level (speaker score) (Lvl)
    # @type (type)
    @clash = 3 # ATTACK
    @presentation = 5 # SP. ATTACK
    @organization = 5 # SPEED
    @civility = 6 # Totally arbitrary
    @cross = 2 # DEFENCE

    @addMoveByClass require 'moves/shout.coffee'
    @addMoveByClass require 'moves/philosophize.coffee'
    @addMoveByClass require 'moves/superintend.coffee'
    @addMoveByClass require 'moves/announce.coffee'
