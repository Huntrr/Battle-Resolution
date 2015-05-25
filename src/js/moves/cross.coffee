$ = require './../lib/jquery.js'
Move = require './../move.coffee'

# Basic cross-ex attack deals damage of self.CROSS - opp.CROSS
module.exports = class Cross extends Move
  constructor: () ->
    super 'CROSS EX'

  getDamage: () ->
    dmg = @user.cross - @target.cross
    return if dmg > 0.1 then dmg else 0.1

  use: (cb) ->
    @target.damage(getDamage())
    @announce cb, if getDamage() < 1 then 'It was not very effective...' else 'That stunning line of cross-examination will surely hurt ' + @target.name + ' greatly!'
