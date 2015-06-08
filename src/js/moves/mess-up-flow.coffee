$ = require './../lib/jquery.js'
Move = require './../move.coffee'

module.exports = class MessUpFlow extends Move
  constructor: () ->
    super 'MESS UP FLOW'

  getDamage: () ->
    return @target.presentation - @user.presentation * 0.5

  use: () ->
    super()
    @target.damage(@getDamage())
    @announce cb, @user.name + ' did what a parent judge does best!'
