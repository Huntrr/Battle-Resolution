$ = require './lib/jquery.js'
require './lib/jquery-ui.js'

# Move class
module.exports = class Move
  constructor: (@name) ->
    @effect = 'shake'
    @effectOptions = {direction: 'right', distance: 20, times: 2}

  announce: (cb, extra = '') ->
    @game.console.put @user + ' used ' + @name '! ' + extra, cb
 
  getDamage: () ->
    return @user.clash / 3 - @target.organization / 6

  use: (cb) ->
    # called when move is used
    @target = @user.getTarget()
    console.log @name + ' used'
    @user.effect(@effect, @effectOptions)

  setUser: (user) ->
    @user = user

  setGame: (game) ->
    @game = game
