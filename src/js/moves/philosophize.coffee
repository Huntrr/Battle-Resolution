$ = require 'lib/jquery.js'
Move = require './../move.coffee'

# Basic REBUILDING move, adds 2 to case
# Also adds enlightened status for two turns
# Can't be used again until enlightened wears off
module.exports = class Philosophize extends Move
  constructor: () ->
    super 'PHILOSOPHIZE'

  getDamage: () ->
    return -2

  use: (cb) ->
    super()
    Enlightened = require 'effects/enlightened.coffee'

    if !@user.has 'ENLIGHTENED'
      damage = @getDamage()
      @user.damage(damage)
      @user.addStatus new Enlightened('ENLIGHTENED', 3)
      @announce cb, 'They became ENLIGHTENED! '
    else
      @announce cb, 'But they were already ENLIGHTENED and it was not very effective....'
