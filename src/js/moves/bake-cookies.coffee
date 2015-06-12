$ = require 'lib/jquery.js'
Move = require './../move.coffee'

# Alyssa's standard clash move
module.exports = class Base extends Move
  constructor: () ->
    super 'BAKE COOKIES'

  getDamage: () ->
    return Math.max(0, @user.presentation - @target.case/2)

  use: (cb) ->
    super()
    damage = @getDamage()
    @target.damage(damage)
    @announce (err) =>
      @game.console.put @user.name + ': Let me tell you a story about BAKING COOKIES...', cb
    , if damage < 0.25 then 'It was not very effective' else ''
