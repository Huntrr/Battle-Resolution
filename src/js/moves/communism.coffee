$ = require './../lib/jquery.js'
Move = require './../move.coffee'

# WHEN I DOUBT, QUOTE MAO
module.exports = class Communism extends Move
  constructor: () ->
    super 'QUOTE MAO'
    @messages = [
      'Every Communist must grasp the truth: Political power grows out of the barrel of a gun.'
    ]

  getDamage: () ->
    return Math.max(2, @user.clash - (@target.cross / 2))

  use: (cb) ->
    super()
    damage = @getDamage()
    @target.damage(damage)
    @announce (err) =>
      @game.console.put 'It was SUPER EFFECTIVE!', cb
    ,@user.name + ': ' + @messages[Math.floor(Math.random() * @messages.length)]
