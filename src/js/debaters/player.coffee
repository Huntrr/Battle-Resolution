$ = require './../lib/jquery.js'
Debater = require './../debater.coffee'

# Player class, extends Debater
module.exports = class Player extends Debater
  constructor: (@game, @name = 'PLAYER', @gender = 'boy') ->
    super(@game, false, @name, 1, 3, 'CAPITALIST')
    @img = @gender

    # set basic statis
    # ALREADY SET (constructed)
    # @case (HP)
    # @level (speaker score) (Lvl)
    # @type (type)
    @clash = 2 # ATTACK
    @presentation = 2 # SP. ATTACK
    @organization = 3 # SPEED
    @civility = 5 # Totally arbitrary
    @cross = 3 # DEFENCE

    @startingCase = @case
    @startingClash = @clash
    @startingPresentation = @presentation
    @startingOrganization = @organization
    @startingCivility = @civility
    @startingCross = @cross
    


  load: () ->
    console.log 'Reloading player'
    @case = @startingCase
    @clash = @startingClash
    @presentation = @startingPresentation
    @organization = @startingOrganization
    @civility = @startingCivility
    @cross = @startingCross
    super()

  say: (what, cb) ->
    @game.console.put(@name + ': ' + what, cb)

  getMove: (cb) ->
    # move selection
    moveArray = []
    moveArray.push([move.name, move]) for move in @moves
    @game.dialog.arrMenu 'Select a move:', moveArray, (err, result) -> cb(err, result)
