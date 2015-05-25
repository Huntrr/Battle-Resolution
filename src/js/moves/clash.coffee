$ = require './../lib/jquery.js'
Move = require './../move.coffee'

# Basic clash attack, deals self.CLASH/6 - opp.ORGANIZATION/12 damage
module.exports = class Clash extends Move
  constructor: () ->
    super 'CLASH'

  getDamage: () ->
    return @user.clash / 6 - @target.organization / 12

  use: (cb) ->
    @target.damage(getDamage())
    @announce cb
