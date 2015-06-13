$ = require './../lib/jquery.js'
Move = require './../move.coffee'

# PROOF BY ASSERTION IS A VALID TACTIC OF ARGUMENT
module.exports = class Cool extends Move
  constructor: () ->
    super 'Cool Ego'

  getDamage: () ->
    return @user.civility

  use: (cb) ->
    super()
    damage = @getDamage()
    @user.damage(damage*-1)
    if (damage > 0)
      @announce cb, "Evan chilled out. His case was increased by " + damage + "."
    else
      @announce cb, "Evan tried to chill out, but he's freaking out! His case was decreased by " + (damage *-1) + "."
