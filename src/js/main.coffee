$ = require './lib/jquery.js'

$ ->
  Game = require './game.coffee'
  game = new Game()

  Menu = require './screens/menu.coffee'
  game.addScreen(new Menu(game))

  Oak = require './screens/oak.coffee'
  game.addScreen(new Oak(game))

  game.start()
