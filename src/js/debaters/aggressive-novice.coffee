$ = require 'lib/jquery.js'
Debater = require './../debater.coffee'

# Basic debater class. Controls an actor in the game
module.exports = class AggressiveNovice extends Debater
  constructor: (@game) ->
    super(@game, true, 'SUPER AGGRESSIVE NOVICE', 1, 5, 'ANGRY KID')

    # set basic statis
    # ALREADY SET (constructed)
    # @case (HP)
    # @level (speaker score) (Lvl)
    # @type (type)
    @clash = 3 # ATTACK
    @presentation = 3 # SP. ATTACK
    @organization = 1 # SPEED
    @civility = 6 # Totally arbitrary
    @cross = 2 # DEFENCE

    Gaff = require 'moves/gaff.coffee'
    @addMove new Gaff()

    Shout = require 'moves/shout.coffee'
    @addMove new Shout()
