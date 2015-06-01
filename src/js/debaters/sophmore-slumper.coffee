$ = require 'lib/jquery.js'
Debater = require './../debater.coffee'

# Basic debater class. Controls an actor in the game
module.exports = class SophmoreSlumper extends Debater
  constructor: (@game) ->
    super(@game, true, 'SOPHMORE SLUMPER', 4, 3, 'SOPHMORE')

    # set basic statis
    # ALREADY SET (constructed)
    # @case (HP)
    # @level (speaker score) (Lvl)
    # @type (type)
    @clash = 4 # ATTACK
    @presentation = 3 # SP. ATTACK
    @organization = 4 # SPEED
    @civility = 6 # Totally arbitrary
    @cross = 3 # DEFENCE

    Ramble = require 'moves/ramble.coffee'
    @addMove new Ramble()

    HalfAssedCase = require 'moves/half-assed-case.coffee'
    @addMove new HalfAssedCase()
