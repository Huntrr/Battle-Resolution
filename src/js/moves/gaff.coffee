$ = require './../lib/jquery.js'
Move = require './../move.coffee'

# Gaff has a CHANCE of confused the judge into awarding you points
# And a CHANGE of backfiring
# Higher presentation = better change of success
module.exports = class Gaff extends Move
  constructor: () ->
    super 'GAFF'

    @messages = [
      'I know you\'re not supposed to cite the packet... but on page 10...',
      'And that\'s why we must liberate Pakastine!',
      'I HEARD IT ON NPR, OKAY?!',
      'And on page 13 of the packet... I mean page 10... I mean... Okay I never actually read the packet.',
      '... Wait, so what\'s solvency?'
    ]

  getDamage: () ->
    return Math.floor((Math.random() * 4) - 3) + @user.presentation / 2

  use: (cb) ->
    super()
    damage = @getDamage()
    @target.damage(damage)

    if damage < 0
      message = 'But the judge was not impressed and the move backfired!!'
    else if damage > 1
      message = 'The GAFF successfully confused the judge, dealing ' + damage + ' damage to ' + @target.name + '\'s case!'
    else
      message = 'It was not very effective...'

    @announce (err) =>
      @game.console.put @user.name + ': ' + @messages[Math.floor(Math.random() * @messages.length)], cb
    , message
