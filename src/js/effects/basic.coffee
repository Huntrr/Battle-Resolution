$ = require 'lib/jquery.js'
Effect = require './../effect.coffee'

# Basic effect that does nothing but invoke the callback
module.exports = class Basic extends Effect
  constructor: (@name, @turns) ->
    super @name, @turns

  invoke: (cb) ->
    super(cb)
    cb(null)

  unload: (cb) ->
    # should gracefully remove the effects of the status
    super(cb)
    cb(null)
