$ = require './../lib/jquery.js'
Screen = require './../screen.coffee'
Debater = require './../debater.coffee'
Player = require './../debaters/player.coffee'
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
      (cb) =>
        @game.opponent.say 'Hello there! Welcome to the world of Barlow Debate!
                            My name is SMITH! People call me SMITH! This world
                            is inhabited by creatures called DEBATERS! For some
                            people, DEBATERS are pets. Others use them for
                            fights. Myself... I teach DEBATERS as a profession.
                            Tell me, would YOU like to join the Barlow Debate
                            Team?', cb
      (cb) =>
        @game.dialog.menu 'Would you like to join Barlow Debate?',
                          ['YES', true],
                          ['NO', false],
                          cb
      (result, cb) =>
        if(result is yes)
          @game.opponent.say 'Great! First, however, you\'ll need to get these
                              permission slips signed... I can help you fill
                              them out. First, are you a DEBATER or are you a
                              GIRL?', cb
        if(result is no)
          @game.opponent.say 'Oh. Well... Goodbye then!\n(YOU LOSE)', (err) =>
            cb('LOST GAME')
            @game.prev()
      (cb) =>
        @game.dialog.menu 'Are you a BOY or a GIRL?',
                          ['BOY', 1],
                          ['GIRL', 2],
                          #['I don\'t conform to the gender binary', 3],
                          cb
      (result, cb) =>
        player = new Player(@game, 'PLAYER',
                                  if result is 2 then 'girl' else 'boy')
        resp = (if result is 3 then '... Okay. That\'s great, but I couldn\'t
                                    find a gender-neutral character picture,
                                    so I\'m going to have to draw you as a guy.
                                    Sorrypleasedontsue.' else '') + 'Next question, what is your name?'

        @game.setPlayer player
        @game.opponent.say resp, cb
      (cb) =>
        @game.dialog.menu 'What is your name?',
                          ['PLAYER ONE', 'PLAYER ONE'],
                          ['PLAYER TWO', 'PLAYER TWO'],
                          ['RED', 'RED'],
                          ['FUSCHIA', 'FUSCHIA'],
                          ['RANDY', 'RANDY'],
                          ['ME', 'ME'],
                          ['RANDOM', 'RANDOM'],
                          ['NONE OF THESE', 'NONE OF THESE ARE MY NAME'],
                          cb
      (name, cb) =>
        @game.player.setName(name)
        @game.opponent.say 'Right! So your name is ' + name + '. Listen ' + name + ' normally,
                            I\'d teach you how to debate before sending you off to face CDA
                            judges, but we just don\'t have time. You see, we\'ve got a bit
                            of an emergency on our hands. Earlier this year, my old co-coach
                            EVAN STREAMS moved to China to teach debate there. And, as I feared,
                            while there, he was abducted by the COMMUNISTS. On top of that, the COMMUNIST
                            leader, XI JINPING has convinced the rest of the CDA to join him under the
                            COMMUNIST FLAG. That means you\'re all I have
                            left. Please ' + name + ' I need you to head out and out-debate
                            XI JINPING, convincing him to become a God-fearing CAPITALIST and
                            saving EVAN STREAMS. You\'re the only
                            hope I have left. Will you help me?', cb
      (cb) =>
        @game.dialog.menu 'Will you help stop the DIRTY COMMIES and restore a love of CAPITALISM to the debate team?',
                          ['YES', true],
                          ['NO', false],
                          cb
      (result, cb) =>
        if(result is yes)
          @game.opponent.say 'Excellent! You\'ll have to head out now and face all of the
                              debaters XI JINPING has turned into COMMUNISTS. Once you\'ve defeated
                              all of them, you\'ll face JINPING himself. But, before you go, I
                              can teach you ONE TECHNIQUE. What would you like to learn?', cb

        if(result is no)
          @game.opponent.say 'Oh. Well... Goodbye then!\n(YOU LOSE)', (err) =>
            cb('LOST GAME')
            @game.prev()

      (cb) =>
        @game.dialog.arrMenu 'Choose a technique to learn:', @game.availableMoves, cb

      (move, cb) =>
        @game.player.addMove(move)
        @game.opponent.say move.name + '? I can definitely explain that... (one hour later)...
                           THERE! All set! Now it\'s off to debate. You\'ll begin in the novice
                           league, so you\'re sure to get some cupcakes at first, but as you
                           win (in the name of CAPITALISM) your opponents will get more
                           difficult. You\'ll learn more techniques over time. Just pay
                           attention to your opponents. Your end-goal, of course, is saving EVAN
                           STREAMS from the DIRTY COMMIES. You gotta out-debate them all. You must convince those COMMUNISTS
                           that the AMERICAN WAY is best, and you must rescue EVAN STREAMS. Good luck ' + @game.player.name + '.', cb
        @game.player.addMoveByClass require 'moves/taiwan.coffee'
      (cb) =>
        @game.opponent.say 'Oh yeah, and one last thing, ' + @game.player.name + '. Never mention Taiwanese Independence. It is the only rule. Taiwanese Independence Added to Move List.', cb
      (cb) =>
        @game.next()
      ]


  unload: () ->
    super()
