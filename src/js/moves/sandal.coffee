$ = require 'lib/jquery.js'
Move = require './../move.coffee'

# Tim Huminski's favorite move. Does base damage of 0.5,
# Never very effective
module.exports = class Sandal extends Move
  constructor: () ->
    super 'THROW SANDAL'

  getDamage: () ->
    return 1

  use: (cb) ->
    super()

    Thrown = require 'effects/thrown.coffee'
    if @user.has('THROWN 1 SANDAL')
      @user.removeStatus('THROWN 1 SANDAL')
      @user.addStatus(new Thrown(2))
      @target.damage(@getDamage() * 2)
      @announce cb, @user.name + ' has thrown their other sandal! It\'s super effective!'
    else if @user.has('THROWN 2 SANDALS')
      @announce cb, 'But ' + @user.name + ' is out of sandals and has none to throw!'
    else
      @user.addStatus(new Thrown (1))
      @target.damage(@getDamage())
      @announce cb, @user.name + ' throws one flip flop at ' + @target.name
