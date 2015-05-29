$ = require 'lib/jquery.js'
Move = require './../move.coffee'

# Has a chance of impressing the opponents, dealing damage and stunning them
module.exports = class Announce extends Move
  constructor: () ->
    super 'MORNING ANNOUNCEMENTS'

  getDamage: () ->
    return @user.presentation / 5

  use: (cb) ->
    super()
    damage = @getDamage()

    
    if !@target.has 'IMPRESSED'
      extra += @target.name + ' was IMPRESSED!'
      Impressed = require 'effects/impress.coffee'
      @target.damage(damage)
      @target.addStatus new Impressed()
    else
      damage = 0

    extra = if damage < 0.5 then 'It was not very effective. ' else 'The judge was thoroughly impressed. '
    @announce cb, extra
