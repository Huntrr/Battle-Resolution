$ = require 'lib/jquery.js'
Move = require './../move.coffee'

# Flees to China for a turn or 2
module.exports = class Flee extends Move
  constructor: () ->
    super 'FLEE TO CHINA'

  use: (cb) ->
    super()
    
    if !@user.has 'FLED'
      @user.civility--
      @user.case *= 2
      extra = @user.name + ' has fled to CHINA! Their CIVILITY falls to ' + @user.civility + ',
                            while their CASE (like everything in CHINA) is COPIED, increasing it to ' + @user.case + '!'
      Basic = require 'effects/basic.coffee'
      @user.addStatus new Basic('FLED', 6, @user.name + ' returns from CHINA, just in time for the DEBATE PARTY!')
    else
      extra = @user.name + ' is already in CHINA and cannot flee again!'

    @announce cb, extra
