$ = require 'lib/jquery.js'
Move = require './../move.coffee'

module.exports = class Shout extends Move
  constructor: () ->
    super 'SHOUT'

  getDamage: () ->
    if @user.has 'ANGRY' then return 0.5 else return 1

  use: (cb) ->
    super()

    @target.damage(@getDamage())
    Angry = require 'effects/angry.coffee'
    if not @user.has 'ANGRY'
      @user.addStatus 'ANGRY'

    @announce cb, 'RRAAAAAGGUUUUGH'
