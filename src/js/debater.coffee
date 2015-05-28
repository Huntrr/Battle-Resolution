$ = require 'lib/jquery.js'
require 'lib/jquery-ui.js'
Async = require 'lib/async.js'

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

    @canMove = true

  setName: (name) ->
    @name = name

  getTarget: () ->
    @other = if @opponent then @game.player else @game.opponent
    return @other # explicit return for readability

  load: () ->
    @me.setImg(dir + @img + (if @opponent then '' else '_back') + ftype)
    @me.setName(@name)
    @statuses = [] # reset statuses on load()
    @update()

  update: () -> #updates states
    @me.setLevel(@level)

    shownCase = Math.floor(@case * 100)/100
    @me.setCase(shownCase)

    status = @type + (if @statuses.length > 0 then '|' else '')
    status += ' ' + effect.name for effect in @statuses
    @me.setStatus(status)

  # move loop
  go: (callback) ->
    @canMove = true

    actions = []
    i = 0
    while i < @statuses.length
      status = @statuses[i]
      if status.expired() #if it's expired, push its unload function to be executed
        actions.push (cb) =>
          status.unload(cb)
          @update()
        @statuses.splice i, 1
      else #else execute its invoke function
        actions.push (cb) =>
          status.invoke(cb)
          @update()
        i++

    actions.push (cb) =>
      if @canMove
        @getMove (err, move) ->
          move.use(callback)
          cb(null)
        @update()

    Async.waterfall actions

  say: (what, cb) ->
    @game.console.put(@name + ': ' + what, cb)

  hasMove: (name) ->
    for move in @moves
      if move.name is name
        return true
    return false

  addMove: (move) ->
    if !@hasMove move.name
      move.setUser(@)
      move.setGame(@game)
      @moves.push(move)

  addMoveByClass: (MoveClass) ->
    move = new MoveClass()
    @addMove move

  addStatus: (status) ->
    status.setTarget(@)
    status.setGame(@game)
    @statuses.push(status)

  has: (status) ->
    for effect in @statuses
      if effect.name is status
        return true
    return false

  getStatus: (status) ->
    for effect in @statuses
      if effect.name is status
        return status
    return null

  removeStatus: (status) ->
    for i in [0...@statuses.length]
      if @statuses[i].name is status
        @statuses.splice i, 1

        # re-execute the function, since the indices in the array
        # are too messed up to continue. Do this until no instances
        # of move are left in statuses (looks heavier than it is
        # since there will never be too many things in @statuses)
        return @removeStatus status

  die: () ->
    @me.charElem.hide('explode', {duration: 1000})

  setHealth: (amount) ->
    @case = amount
    @update()
    if @case <= 0
      @die()

  damage: (amount) ->
    @setHealth @case - amount

  heal: (amount) ->
    @damage(-amount)

  getMove: (cb) -> # async because player moves
    move = @moves[Math.floor(Math.random()*@moves.length)]
    cb(null, move)
