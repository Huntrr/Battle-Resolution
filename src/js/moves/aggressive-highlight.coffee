$ = require 'lib/jquery.js'
Move = require './../move.coffee'

module.exports = class AgressiveHighlight extends Move
  constructor: () ->
    super 'AGGRESIVE HIGHLIGHT'

  getDamage: () ->
    dmg = @target.cross + @target.presentation
    return if dmg > 0.1 then dmg else 0.1

  use: (cb) ->
    super()

    @target.damage(@getDamage())
    @announce cb, @user.name + ' dealt ' + @getDamage +' dmg'
