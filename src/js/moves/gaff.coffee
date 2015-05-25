$ = require './../lib/jquery.js'
Move = require './../move.coffee'

# Gaff has a CHANCE of confused the judge into awarding you points
# And a CHANGE of backfiring
# Higher presentation = better change of success
module.exports = class Gaff extends Move
  constructor: () ->
    super 'GAFF'

  getDamage: () ->
    return Math.floor((Math.random() * 4) - 3) + @user.presentation / 2

  use: (cb) ->
    @target.damage(getDamage())
    @announce cb, if getDamage() < 0 then 'But the judge was not impressed and the move backfired!!' else 'The GAFF successfully confused the judge!'
