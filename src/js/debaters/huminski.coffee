$ = require 'lib/jquery.js'
Debater = require './../debater.coffee'

# Tim Huminski. Level 2
module.exports = class Huminski extends Debater
  constructor: (@game) ->
    super(@game, true, 'T HUMINSKI', 1, 3, 'ENGLISH TEACHER')

    # set basic statis
    # ALREADY SET (constructed)
    # @case (HP)
    # @level (speaker score) (Lvl)
    # @type (type)
    @clash = 2 # ATTACK
    @presentation = 4 # SP. ATTACK
    @organization = 1 # SPEED
    @civility = 5 # Totally arbitrary
    @cross = 1 # DEFENCE

    Sandal = require 'moves/sandal.coffee'
    @addMove(new Sandal())

    Ramble = require 'moves/ramble.coffee'
    @addMove(new Ramble())
