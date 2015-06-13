$ = require 'lib/jquery.js'
Move = require './../move.coffee'

module.exports = class RunForPres extends Move
  constructor: () ->
    super 'RUN FOR PRESIDENT'

  getDamage: () ->
    return 100

  use: (cb) ->
    #get it.. because he can do some much damage but never actually uses the ability?
    #heh, ron paul
    @announce cb, @user.name + ' ran for president... it wasn\'t very effective.'
