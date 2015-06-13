$ = require './../lib/jquery.js'
Move = require './../move.coffee'

module.exports = class MessUpFlow extends Move
  constructor: () ->
    super 'MESS UP FLOW'

  getDamage: () ->
    return @target.presentation - @user.presentation * (Math.random()) * 0.25

  use: (cb) ->
    super()
    @target.damage(@getDamage())
    @announce cb, @user.name + ' did what a parent judge does best! The messed up fllow dealt ' + @getDamage() + ' damage to ' + @target.name + '!'
