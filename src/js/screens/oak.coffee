$ = require './../lib/jquery.js'
Screen = require './../screen.coffee'
Debater = require './../debater.coffee'
Async = require './../lib/async.js'

module.exports = class Oak extends Screen
  constructor: (@game) ->
    super @game

  load: () ->
    super()
    @game.setOpponent(new Debater(@game, true, 'SMITH', 31, 6, 'COACH'))
    @game.opponentElem.show()
    @game.console.show()

    Async.waterfall [
      (cb) =>
        @game.pause 1000, cb
      , (cb) =>
        @game.opponent.say 'Hello there! Welcome to the world of Barlow Debate!
                            My name is SMITH! People call me SMITH! This world
                            is inhabited by creatures called DEBATERS! For some
                            people, DEBATERS are pets. Others use them for
                            fights. Myself... I teach DEBATERS as a profession.
                            Tell me, would YOU like to join the Barlow Debate
                            Team?', cb
      , (cb) =>
        @game.dialog.menu 'Would you like to join Barlow Debate?',
                          ['YES', true],
                          ['NO', false],
                          cb
      , (result, cb) =>
        if(result is yes)
          @game.opponent.say 'Great!', cb
        if(result is no)
          @game.opponent.say 'Oh. Well... Goodbye then!\n(YOU LOSE)', (err) =>
            cb('LOST GAME')
            @game.prev()
      ]

  unload: () ->
    super()
