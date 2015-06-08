 # coffeelint: disable=max_line_length
$ = require './lib/jquery.js'

$ ->
  Game = require './game.coffee'
  game = new Game()

  testConf = require './testmode-conf.coffee'
  if testConf.enabled
    Test = require './testmode.coffee'
    test = new Test(game)
    test.run()
  else
    # set up starter moves
    game.addMove require 'moves/flourish.coffee'
    game.addMove require 'moves/clash.coffee'
    game.addMove require 'moves/cross.coffee'

    # set up screen order
    Menu = require './screens/menu.coffee'
    game.addScreen(new Menu(game))

    Oak = require './screens/oak.coffee'
    game.addScreen(new Oak(game))

    # Battle screens
    Battle = require './battle.coffee'

    # LEVEL 1 - Novice
    game.addScreen(new Battle(game, require('debaters/novice.coffee'),
                              'This is my first debate! I hope I can
                              convince you of the merits of COMMUNISM...
                              But first... How long is my speech?',
                              'Wow. You\'re really good. I think I\'m
                              going to go home and read up on Keynes...',
                              'And THAT\'S why we must affirm the resolution
                              that... I mean we must NEGATE the resolution that
                              resolved... this house would... we are...
                              COMMUNISM!',
                              [require('moves/gaff.coffee')])
    )

    # LEVEL 2 - Huminski
    game.addScreen(new Battle(game, require('debaters/huminski.coffee'),
                              'Hello! T-bone Huminski here! Fear my
                              sandals, and prepare to die!',
                              'Oh... I lost... This is like the Integrity
                              Basketball game all over again... Oh well...
                              At least I still have my sandals',
                              'Hah! That\'s right! I just GATSBY\'d you
                              so hard! ... Yea that makes sense, why
                              wouldn\'t it!?',
                              [require('moves/ramble.coffee'), require('moves/sandal.coffee')])
    )

    # LEVEL 3 - Really aggressive novice
    game.addScreen(new Battle(game, require('debaters/aggressive-novice.coffee'),
                              'FREE THOUGHT is dumb! SMITH only teaches you
                              stock arguments anyway...',
                              'I still refuse to change my way of thinking.
                              The JUDGE was the wrong one here.',
                              'Ha ha! I told you FREE THOUGHT was super dumb',
                              #require('moves/gaff.coffee'), add back in later
                              [require('moves/shout.coffee')])
    )

    # LEVEL 4 - Sophmore Slumper

    # LEVEL 5 - The Complexity Rubric (secretly a communist plot)

    # LEVEL 6 - THE CAPTAIN (boss #1, picture of McMoran)
    # (start dialogue with 'This is your captain speaking. Today, I discovered communism')
    game.addScreen(new Battle(game, require('debaters/captain.coffee'),
                              'This is your captain speaking. Today, I have discovered communism.
                              And I\'m here to share with you the good word... You may have beaten
                              my right-hand-man (the complexity rubric), but you aren\'t going to
                              beat me, no matter how AMBIGUOUS you are!',
                              'Oh... I guess I\'m wrong after all... You\'ve embraced more ambiguity
                              than I ever have. Oh, teach me more about this INVISIBLE HAND! CAPITALISM
                              reminds me a lot of my complexity rubric.',
                              'That\'s right! Embrace ambiguity? Psh, yeah right! More like, embrace
                              the fact that OWNERSHIP is a LIE and the CLASS-HIERARCHY must die!',
                              [require('moves/philosophize.coffee'), require('moves/announce.coffee')])
    )

    # LEVEL 20 - CDA Parent Judge
    game.addScreen(new Battle(game, require('debaters/parent-judge.coffee'),
                              'WAIT JUST ONE FREE THINKING MOMENT!! You\'ve been
                              advocating for CAPITALISM?! How\'d you win so much when I\'ve been judging you?
                              Either way... You\'ll have to beat ME now! ',
                              'Wait who\'s judging? Huh... well you win this time! I guess there\'s a reason
                              you\'ve been winning ',
                              'pffft guess I\'ll have to look out twice for dirty CAPPY\'S like yourself',
                              [require 'moves/mess-up-flow.coffee']))

    # LEVEL 22 - Sam Aldershof

    # LEVEL 25 - Nicolo Marzaro

    # LEVEL 27 - Alyssa Bilinski
    # Special move: Talk about Grandma's cookies (the Judge was thoroughly Pathos'd)

    # LEVEL 28 - Ron Paul (thinks he is at Libertarian National Convention)
    # Special move: The Gold Standard
    # Special move: Summon Brooke Curto

    # LEVEL 29 - Xi Jinping
    # PLOT TWIST: LOSE MESSAGE: Reveal EVAN IS A COMMY (You can see your friend now, but I have a surprise for you...)

    # LEVEL "30" - Evan streams
    # OPENER: I WAS THE COMMUNIST ALL ALONG
    # Need a super lengthy explanation...

    # Closing screen for winning, show Evan back to good side

  # start the game
  game.start()
