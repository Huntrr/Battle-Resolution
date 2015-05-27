$ = require './../lib/jquery.js'
Move = require './../move.coffee'

module.exports = class HalfAssedCase extends Move
  constructor: () ->
    super 'ANOTHER HALF ASSED CONTENTION'

  getDamage: () ->
    return 1

  use: (cb) ->
    super()
    Bored = require('effects/bored.coffee')
    Asleep = require('effects/asleep.coffee')

    if @target.has 'BORED'
      @announce cb, @target.name + ' is having a difficult time staying awake!'
      if Math.floor(Math.random() * 3) is 1
        @target.addStatus new Asleep(1)

    else
      @target.addStatus new Bored(2, Math.floor(Math.random() * 3) + 1)
      @announce cb, @target.name + ' looks bored, how rude.'

    damage = @getDamage()
    @target.damage(damage)

    if damage < 0.5
      message = @user.name + ' looked sad and the JUDGE didn\'t like their lack of confidence'
    else
      message = @user.name + ' managed to slip in an unnoticed fallacy.'

    @announce cb, message
