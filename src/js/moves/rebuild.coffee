$ = require 'lib/jquery.js'
Move = require './../move.coffee'

module.exports = class Rebuild extends Move
  constructor: () ->
    super 'REBUILD'

  getHealing: () ->
    return (@user.cross + @user.clash) * 0.1

  use: (cb) ->
    super()
    healed = @getHealing()
    @user.heal(healed)
    @announce cb, @user.name + ' has rebuilt their case by ' + healed + ' points!'
