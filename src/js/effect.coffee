$ = require './lib/jquery.js'

# Effect class (for adding statuses to players
module.exports = class Effect
  constructor: (@name, @turns) ->

  invoke: (cb) ->
    # called when move is used
    console.log @name + ' invoked'
    if @turns > 0
      @turns--

  unload: (cb) ->
    # should gracefully remove the effects of the status

  expired: () ->
    return @turns is 0

  setGame: (game) ->
    @game = game

  setTarget: (target) ->
    @target = target
