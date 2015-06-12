$ = require 'lib/jquery.js'
Move = require './../move.coffee'

# Basic clash attack, deals damage proportional to ORGANIZATION
# Also reduces opponents civility by 2
module.exports = class Superintend extends Move
  constructor: () ->
    super 'SUPERINTEND'

  getDamage: () ->
    return Math.max(0, (@user.organization - @target.organization)/2)

  use: (cb) ->
    super()
    damage = @getDamage()
    @target.damage(damage)
    @target.civility = @target.civility - 2

    extra = @target.name + '\'s CIVILITY fell to ' + @target.civility + '. '
    extra += if damage < 0.5 then 'It was not very effective. ' else ''
    
    @announce cb, extra
