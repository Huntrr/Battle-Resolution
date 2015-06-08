$ = require 'lib/jquery.js'
Move = require './../move.coffee'

module.exports = class Shout extends Move
  constructor: () ->
    super 'SHOUT'

  getDamage: () ->
    damage = @user.clash - @target.clash
    if @user.has 'ANGRY' then damage *= 0.75
    return damage

  use: (cb) ->
    super()
    @target.damage(@getDamage())
    Angry = require 'effects/angry.coffee'
    if not @user.has 'ANGRY'
      @user.addStatus new Angry()

    @announce cb, 'RRAAAAAGGUUUUGH'
