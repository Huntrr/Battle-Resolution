$ = require 'lib/jquery.js'
Effect = require './../effect.coffee'

module.exports = class Asleep extends Effect
  constructor: (@turns) ->
    super 'ASLEEP', @turns

  invoke: (cb) ->
    super(cb)
    @target.canMove = false
    console.log 'canmove: ' + @target.canMove
    @game.console.put(@target.name + ' is asleep and can\'t speak!', cb)

  unload: (cb) ->
    # should gracefully remove the effects of the status
    super(cb)
    @game.console.put(@target.name + ' wakes with a snort.', cb)
    cb(null)
