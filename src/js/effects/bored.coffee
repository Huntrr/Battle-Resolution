$ = require 'lib/jquery.js'
Effect = require './../effect.coffee'

# Sample BORED effect reduces clash until expiration
module.exports = class Bored extends Effect
  constructor: (@amount, @turns) ->
    super 'BORED', @turns
    @applied = false

  invoke: (cb) ->
    super(cb)
    if !@applied
      @applied = true
      @originalClash = @target.clash
      @target.clash = Math.max(1, @target.clash - @amount)

    @announce cb, @target.name + ' is having a difficult time staying awake!'
    if Math.floor(Math.random() * 3) is 1
      @target.addStatus new Asleep(1)

    cb(null)

  unload: (cb) ->
    # should gracefully remove the effects of the status
    super(cb)
    @target.clash = @originalClash
    @game.console.put(@target.name + ' has recoved from their BOREDOM.', cb)
