$ = require 'lib/jquery.js'
Move = require './../move.coffee'

# Alyssa's alt move
module.exports = class SaveWorld extends Move
  constructor: () ->
    super 'SAVE WORLD'

  getDamage: () ->
    return -3

  use: (cb) ->
    super()
    Enlightened = require 'effects/enlightened.coffee'

    if !@user.has 'ENLIGHTENED'
      damage = @getDamage()
      @user.damage(damage)
      @user.addStatus new Enlightened('ENLIGHTENED', 3)
      @announce cb, 'They cleaned ALL the WATER, saving the lives of millions.
                    As a result ' + @user.name + ' became ENLIGHTENED!'
    else
      @announce cb, 'But they were already ENLIGHTENED, all the WATER was already CLEAN, and it was not very effective...'
