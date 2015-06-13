$ = require './../lib/jquery.js'
Move = require './../move.coffee'

# 30% chance of backfiring and hurting your own case
module.exports = class Corruption extends Move
  constructor: () ->
    super 'Eradicate Corruption'
    @failure = Math.random()

  getDamage: () ->
    @failure = Math.random()
    if (@failure < 0.30)
      return @user.cross/2
    else
      return @target.cross/2


  use: (cb) ->
    super()
    damage = @getDamage()
    if (@failure < 0.30)
      @user.damage(damage)
      @announce cb, @user.name + '\'s attempt to remove corrupt leaders backfired! Dealt ' + damage + ' damage to ' + @user.name + '!'
    else
      @target.damage(damage)
      @announce cb, @user.name + '\'s attempt to remove corrupt leaders was successful! Dealt ' + damage + ' damage to ' + @target.name + '!'
