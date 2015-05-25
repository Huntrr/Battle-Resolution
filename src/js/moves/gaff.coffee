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
    super()
    damage = @getDamage()
    @target.damage(damage)

    if damage < 0
      @announce cb, 'But the judge was not impressed and the move backfired!!'
    else if damage > 1
      @announce cb, 'The GAFF successfully confused the judge, dealing ' + damage + ' damage to ' + @target.name + '\'s case!'
    else
      @announce cb, 'It was not very effective...'
