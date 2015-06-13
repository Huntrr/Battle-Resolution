$ = require './../lib/jquery.js'
Move = require './../move.coffee'

# Taiwanese Independence doesn't do anything to anyone, except when the enemy is in a meditative state
# If the enemy is in a meditative state, it throws them into a rage
module.exports = class Taiwan extends Move
  constructor: () ->
    super 'ASSERT TAIWANESE SOVEREIGNTY'

  getDamage: () ->
    return 0

  use: (cb) ->
    super()
    Rage = require 'effects/rage.coffee'
    @target.damage(@getDamage())
    if @target.name == 'EVAN STREAMS'
      if @target.has('RAGE')
        @announce cb, 'But ' + @target.name + ' was already ENRAGED!'
      else
        @target.addStatus new Rage()
        @announce cb, @target.name + ' became enraged!'
    else
      @user.damage(1000000)
      @announce cb, 'But mentioning TAIWANESE INDEPENDENCE is against the rules! ' + @user.name + ' was kicked out of the tournament!'
