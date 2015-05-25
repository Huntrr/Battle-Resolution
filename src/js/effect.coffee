$ = require './lib/jquery.js'

# Effect class (for adding statuses to players
module.exports = class Effect
  constructor: (@name, @turns) ->

  invoke: () ->
    # called when move is used
    console.log @name + ' invoked'
    @turns--

  expired: () ->
    return @turns <= 0
  
  setGame: (game) ->
    @game = game

  setTarget: (target) ->
    @target = target
