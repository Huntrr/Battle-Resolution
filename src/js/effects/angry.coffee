$ = require 'lib/jquery.js'
Effect = require './../effect.coffee'

module.exports = class Angry extends Effect
  constructor: () ->
    super 'ANGRY', 2

  invoke: (cb) ->
    super(cb)
    cb(null)

  unload: (cb) ->
    # should gracefully remove the effects of the status
    super(cb)
    cb(null)
