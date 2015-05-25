$ = require './../lib/jquery.js'
Move = require './../move.coffee'

# Flourish does damage proportional to PRESENTATION
# Is stronger against weaker cases
module.exports = class Flourish extends Move
  constructor: () ->
    super 'FLOURISH'

  getDamage: () ->
    dmg = @user.presentation - @target.case / 3
    return if dmg > 0.1 then dmg else 0.1

  use: (cb) ->
    super()
    @target.damage(@getDamage())
    @announce cb, if @getDamage() < 1 then 'It was not very effective...' else 'The judge was thoroughly impressed with ' + @user.name + '\'s flair!'
