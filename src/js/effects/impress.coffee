$ = require 'lib/jquery.js'
Effect = require './../effect.coffee'

module.exports = class Impressed extends Effect
  constructor: () ->
    super 'IMPRESSED', 2

  invoke: (cb) ->
    super(cb)
    if @turns is 1
      @target.canMove = false
      @game.console.put @target.name + ', IMPRESSED by their opponents, is at a LOSS FOR WORDS!', cb
    else
      cb(null)

  unload: (cb) ->
    # should gracefully remove the effects of the status
    super(cb)
    @game.console.put @target.name + ' has recovered their ability to SPEAK!', cb
