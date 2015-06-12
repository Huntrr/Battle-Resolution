$ = require 'lib/jquery.js'
Effect = require './../effect.coffee'
Basic = require 'effects/basic.coffee'

# Basic effect that does nothing but prevent moving on the first move of its invokement
module.exports = class Enlightened extends Basic
  constructor: (@name, @startTurns) ->
    super @name, @startTurns

  invoke: (cb) ->
    super(cb)
    if @turns is @startTurns - 1
      # first move
      @target.canMove = false
      @game.console.put @target.name + ' is MEDITATING on their ENLIGHTENMENT and is unable to move!', cb
    else
      cb(null)

  unload: (cb) ->
    # should gracefully remove the effects of the status
    super(cb)
    cb(null)
