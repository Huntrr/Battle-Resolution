$ = require './../lib/jquery.js'
Move = require './../move.coffee'

# Basic clash attack, deals self.CLASH/6 - opp.ORGANIZATION/12 damage
module.exports = class Clash extends Move
  constructor: () ->
    super 'CLASH'

  getDamage: () ->
    return Math.max(0, (@user.clash / 3) - (@target.organization / 12))

  use: (cb) ->
    super()
    damage = @getDamage()
    @target.damage(damage)
    @announce cb, if damage < 0.25 then 'It was not very effective' else ''
