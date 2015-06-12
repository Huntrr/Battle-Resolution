$ = require 'lib/jquery.js'
Async = require 'lib/async.js'
Screen = require './screen.coffee'

# Battle screen. Pits player against an enemy
module.exports = class Battle extends Screen
  constructor: (@game, @Opponent, @opener = 'For Karl Marx!', @won = '... You know what? You\'re right. Maybe CAPITALISM is better after all!', @lost = 'Hah! That\'s right! Another win for COMMUNISM.', @NewMoves) ->

  load: () ->
    super()

    # establishes enemy and does opening line
    @player = @game.player
    @enemy = new @Opponent(@game)
    @game.setOpponent(@enemy)
    @game.player.load() # reloads player to update stats
    @game.opponentElem.show()
    @game.playerElem.show()
    @game.console.show()

    @game.opponent.say @opener, (err) => @begin()

  unload: () ->
    super()

  makeTurn: () ->
    # player with higher organization goes first
    if @player.organization >= @enemy.organization
      @first = @player
      @second = @enemy
    else
      @first = @enemy
      @second = @player

    Async.waterfall [
      (cb) =>
        @first.go(cb)
      (cb) =>
        console.log 'First move done'
        @player.update()
        @enemy.update()
        if @player.case <= 0 or @enemy.case <= 0
          cb('END')
        else
          cb(null)
      (cb) =>
        @second.go(cb)
      (cb) =>
        @player.update()
        @enemy.update()
        if @player.case <= 0 or @enemy.case <= 0
          cb('END')
        else
          cb(null)
    ]
    , (err) =>
      if err is 'END'
        # someone is dead
        if(@enemy.case <= 0)
          @win()
        else if(@player.case <= 0)
          @lose()
      else
        # keep going
        @makeTurn()

  begin: () ->
    @makeTurn()
    console.log 'Beginning fight'

  win: () ->
    @game.opponent.say @won, (err) =>
      @game.addMove(newMove) for newMove in @NewMoves
      @game.levelUp (err) => @game.next()

  lose: () ->
    @game.opponent.say @lost, () =>
      @game.dialog.menu 'You LOST. Would you like to continue?',
                        ['YES, CONTINUE', true],
                        ['NO, QUIT', false],
                        (err, cont) =>
                          if cont
                            @game.change(0)
                          else
                            @game.restart()
