$ = require './lib/jquery.js'

$ ->
  Game = require './game.coffee'
  game = new Game()

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


  # start the game
  game.start()
