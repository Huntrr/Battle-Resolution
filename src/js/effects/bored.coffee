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

    Asleep = require 'effects/asleep.coffee'
    @game.console.put @target.name + ' is having a difficult time staying awake!', cb
    if Math.floor(Math.random() * 4) is 1 and not @target.has 'ASLEEP'
      # 1/something chance of falling asleep as long as the target isn't already asleep
      @target.addStatus new Asleep(1)

  unload: (cb) ->
    # should gracefully remove the effects of the status
    super(cb)
    @target.clash = @originalClash
    @game.console.put(@target.name + ' has recoved from their BOREDOM.', cb)
