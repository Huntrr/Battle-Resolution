$ = require './../lib/jquery.js'
Move = require './../move.coffee'

# PROOF BY ASSERTION IS A VALID TACTIC OF ARGUMENT
module.exports = class Clash extends Move
  constructor: () ->
    super 'PROOF BY ASSERTION'

  getDamage: () ->
    return Math.max(2, @user.clash - (@target.cross / 2))

  use: (cb) ->
    super()
    damage = @getDamage()
    @target.damage(damage)
    @announce (err) =>
      @game.console.put @user.name + ': PROOF BY ASSERTION IS A VALID TACTIC OF ARGUMENT!', cb
    , 'It was SUPER EFFECTIVE!'
