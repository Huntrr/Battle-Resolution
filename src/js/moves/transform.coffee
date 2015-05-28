$ = require 'lib/jquery.js'
Move = require './../move.coffee'

module.exports = class Transform extends Move
  constructor: () ->
    super 'TRANSFORM'

  use: (cb) ->
    super()

    #@target.damage(@getDamage())
    #Angry = require 'effects/angry.coffee'
    #if not @user.has 'ANGRY'
    #  @user.addStatus new Angry()

    @announce cb, 'Transforming'
