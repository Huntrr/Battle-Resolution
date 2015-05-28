$ = require 'lib/jquery.js'
Debater = require './../debater.coffee'

# Basic debater class. Controls an actor in the game
module.exports = class ComplexityRubric extends Debater
  constructor: (@game) ->
    super(@game, true, 'COMPLEXITY RUBRIC', 3, 3, 'STANDARD')

    # set basic statis
    # ALREADY SET (constructed)
    # @case (HP)
    # @level (speaker score) (Lvl)
    # @type (type)
    @clash = 3 # ATTACK
    @presentation = 1 # SP. ATTACK
    @organization = 2 # SPEED
    @civility = 4 # Totally arbitrary
    @cross = 2 # DEFENCE

    #Star = require 'moves/star.coffee'
    #@addMove new Star()

    #Shout = require 'moves/shout.coffee'
    #@addMove new Shout()

    AggressiveHighlight = require 'moves/aggressive-highlight.coffee'
    @addMove new AggressiveHighlight()
