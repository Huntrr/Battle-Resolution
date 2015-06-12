$ = require 'lib/jquery.js'
Move = require './../move.coffee'

# Sits down, recovering case
module.exports = class Sit extends Move
  constructor: () ->
    super 'SIT DOWN STRANGELY'

  use: (cb) ->
    super()
    
    if !@user.has 'SITTING'
      @user.case += 2
      extra = @user.name + ' SITS DOWN! Some CASE is recovered in the process!'
      Basic = require 'effects/basic.coffee'
      @user.addStatus new Basic('SITTING', 2, @user.name + ' STANDS UP!')
    else
      extra = @user.name + ' is already SITTING and so the MOVE does SQUAT!'

    @announce cb, extra
