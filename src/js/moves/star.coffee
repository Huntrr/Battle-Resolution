$ = require 'lib/jquery.js'
Move = require './../move.coffee'

module.exports = class Star extends Move
  constructor: () ->
    super 'STAR DECISION MAKING MODEL'

  getDamage: () ->
    return 0

  use: (cb) ->
    super()

    @target.damage(@getDamage())

    @announce cb, @user.name + ' stopped to think, act, and reflect on its actions. \nIt was not very effective... '
