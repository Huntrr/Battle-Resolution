$ = require 'lib/jquery.js'
Effect = require './../effect.coffee'

module.exports = class Angry extends Effect
  constructor: () ->
    super 'RAGE', 3

  invoke: (cb) ->
    super(cb)
    @target.civility -= 10
    @game.console.put(@target.name + ' is ENRAGED by TAIWANESE INDEPENDENCE.' + @target.name + " just lost 10 civility points!", cb)

  unload: (cb) ->
    # should gracefully remove the effects of the status
    super(cb)
    @target.civility += 30
    @game.console.put(@target.name + ' calmed down about TAIWANESE INDEPENDENCE.', cb)
