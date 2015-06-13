$ = require './../lib/jquery.js'
Move = require './../move.coffee'

# WHEN I DOUBT, QUOTE MAO
module.exports = class Communism extends Move
  constructor: () ->
    super 'QUOTE MAO'
    @messages = [
      'Every Communist must grasp the truth: Political power grows out of the barrel of a gun.',
      'Our principle is that the Party commands the gun, and the gun must never be allowed to command the Party.',
      'Be resolute, fear no sacrifice and surmount every difficulty to win victory.',
      'Liberalism is extremely harmful in a revolutionary collective. It is a corrosive which eats away unity, undermines cohesion, causes apathy and creates dissension. It robs the revolutionary ranks of compact organization and strict discipline, prevents policies from being carried through and alienates the Party organizations from the masses which the Party leads. It is an extremely bad tendency.',
      'We should support whatever our enemies oppose and oppose whatever our enemies support.',
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
