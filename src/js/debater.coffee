$ = require './lib/jquery.js'

# constants
dir = './img/char/'
ftype = '.png'

# Basic debater class. Controls an actor in the game
module.exports = class Debater
  constructor: (@game, @opponent = true, @name = 'SMITH', @level = 30,
                @case = 4, @type = 'DEBATER') ->
    @me = if @opponent then @game.opponentElem else @game.playerElem
    @img = @name

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

    @moves = []
    @statuses = []

  setName: (name) ->
    @name = name

  getTarget: () ->
    @other = if @opponent then @game.player else @game.opponent
    return @other # explicit return for readability

  load: () ->
    @me.setImg(dir + @img + (if @opponent then '' else '_back') + ftype)
    @me.setName(@name)
    @me.setLevel(@level)
    @me.setStatus(@type)
    @me.setCase(@case)

  say: (what, cb) ->
    @game.console.put(@name + ': ' + what, cb)

  addMove: (move) ->
    move.setUser(@)
    move.setGame(@game)
    @moves.push(move)

  addStatus: (status) ->
    status.setTarget(@)
    status.setGame(@game)
    @statuses.push(status)

  damage: (amount) ->
    @case -= amount

  heal: (amount) ->
    @damage(-amount)
