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
    game.addScreen(new Battle(game, require('debaters/sophmore-slumper.coffee'),
                              'ugh, why even bother with this...? woo COMMUNISM',
                              'whatever CAPITALISM is fine too I guess',
                              'what? gee dude, you sure you\'re a varsity worthy debater?',
                              [require('moves/half-assed-case.coffee')]))

    # LEVEL 5 - The Complexity Rubric (secretly a communist plot)
    game.addScreen(new Battle(game, require('debaters/complexity-rubric.coffee'),
                                    'WE WILL NOT STOP UNTIL THE ENTIRE WORLD HAS SUCCUMBED TO STANDARDS AND QUOTAS.',
                                    'TOO...MUCH...RISK TAKING...',
                                    'YOU ARE A DEVELOPING DEBATER. LONG LIVE THE COMMON CORE!',
                                    [require('moves/star.coffee')])
    )
    # LEVEL 6 - THE CAPTAIN (boss #1, picture of McMoran)
    # (start dialogue with 'This is your captain speaking. Today, I discovered communism')
    game.addScreen(new Battle(game, require('debaters/captain.coffee'),
                              'This is your captain speaking. Today, I have discovered COMMUNISM.
                              And I\'m here to share with you the good word... You may have beaten
                              my right-hand-man (The Complexity Rubric), but you aren\'t going to
                              beat me, no matter how AMBIGUOUS you are!',
                              'Oh... I guess I\'m wrong after all... You\'ve embraced more AMBIGUITY
                              than I ever have. Oh, teach me more about this INVISIBLE HAND! CAPITALISM
                              reminds me a lot of my Complexity Rubric.',
                              'That\'s right! Embrace AMBIGUITY? Psh, yeah right! More like, embrace
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
    #
    # LEVEL 25 - Nicolo Marzaro
    #
    # LEVEL 27 - Alyssa Bilinski
    # Special move: Talk about Grandma's cookies (the Judge was thoroughly Pathos'd)
    game.addScreen(new Battle(game, require('debaters/alyssa.coffee'),
                              'If YALE (together with XI JINPING) taught me anything,
                              it\'s that I can save the world, and that the path to
                              saving the world is paved with COMMUNISM. And FRESH BAKED
                              COOKIES. Here are my THREE CONTENTIONS. You\'re about to be
                              BILINSKI\'d!',
                              'What? I lost!? The last time I LOST a debate was in <ERROR: 404,
                              YEAR NOT FOUND>! Well I guess you\'re right after all then...',
                              'And THAT is why you must AFFIRM. Thank you for your time and I now
                              stand open to kicking this CAPPY\'s ***',
                              [require('moves/bake-cookies.coffee'), require('moves/save-world.coffee')]))

    # LEVEL 28 - Ron Paul (thinks he is at Libertarian National Convention)
    game.addScreen(new Battle(game, require('./debaters/ron-paul.coffee'),
                              'Is this the Libertarian National Convention??
                              ...     ...     ...whaaaaaat? Invisible hands?
                                    Radical freedom?',
                              'Blasted! Well I guess I\'ll run again next year',
                              'HA! ...Wait I won something? It wasn\'t the pesidency was it?
                              ....... didn\'t think so',
                              [require 'moves/run-for-pres.coffee']))
    # Special move: The Gold Standard
    # Special move: Summon Brooke Curto
    game.addScreen(new Battle(game, require('debaters/ron-paul.coffee'),
                              'Is this the Libertarian National Convention??
                              ...     ...     ...whaaaaaat? Invisible hands?
                                    Radical freedom?',
                              'Blasted! Well I guess I\'ll come again next year',
                              'HA! ...Wait I won something? It wasn\'t the pesidency was it?
                              ....... didn\'t think so',
                              [require 'moves/run-for-pres.coffee']))

    # LEVEL 29 - Xi Jinping
    # PLOT TWIST: LOSE MESSAGE: Reveal EVAN IS A COMMY (You can see your friend now, but I have a surprise for you...)
    game.addScreen(new Battle(game, require('debaters/xi.coffee'),
                              'Has the little money-grabbing punk come to rescue his little friend? I knew I couldn\'t trust those CORRUPT officials to do my dirty work. Now it is time for me to end this.',
                              '...I now realize the error of the dream of reviving WORLDWIDE COMMUNISM. You can see your friend now, but we have created a monster that even I cannot contain...',
                              'Should have sent Kissinger.',
                              [require('moves/communism.coffee')]))
    # LEVEL "30" - Evan streams
    # OPENER: I WAS THE COMMUNIST ALL ALONG
    # Need a super lengthy explanation...
    game.addScreen(new Battle(game, require('debaters/evan.coffee'),
                              'SURPRISE! I was the DIRTY COMMY the whole time! You see, like everyone
                              in CHINA, I quickly realized the merits of COMMUNISM and shed all traces of
                              my CAPITALIST past! Then, using my superior DEBATE ABILITIES, I convinced the
                              rest of the CDA to join me. If it hadn\'t been for you MEDDLING DEBATER(S), I would
                              have succeeded in my goal of TAKING OVER THE WORLD! But wait... There might be one
                              last hope. If I can convince you to join me--and embrace the COMMY CAUSE--we might,
                              together, have enough debate power to destroy CAPITALISM once and for all! That\'s
                              it! RESOLVED: You are going to help me take over the world! I have three major
                              CONTENTIONS!',
                              'What. What? You mean... You\'re right! There IS no society on the PLANET ideal enough
                              for COMMUNISM to be successful! I never thought about it like that... I guess... I guess...
                              I guess I\'ll just have to settle for CAPITALISM. Thank you, young stranger, for saving
                              me from my own destruction... I owe you. The world owes you. AMERICA owes you! And for
                              that reason, Mr. Judge, I urge you to negate the aforementioned resolution. Good job KID,
                              you won.',
                              'And that is why, Mr. Speaker, you MUST affirm the resolution! Take that you CAPITALIST
                              PIG! Now, join me, and together we will take over the world!',
                              [])
    )

    # Closing screen for winning, show Evan back to good side

  # start the game
  game.start()
