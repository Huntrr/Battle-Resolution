$ = require('./lib/jquery.js')

# imports
Side = require('./side.coffee')
Dialog = require('./dialog.coffee')
Console = require('./console.coffee')

module.exports = class Game
  constructor: () ->
    @screens = []
    @index = 0
    
    # set up elements of the field
    @opponentElem = new Side($('.top .bar'), $('.top .char'))
    @playerElem = new Side($('.bottom .bar'), $('.bottom .char'))
    @dialog = new Dialog($('.dialog'))
    @console = new Console($('.message'))

  load: (screen) ->
    @current.unload()
    @current = screen
    @current.load()

  addScreen: (screen) ->
    @screens.push(screen)

  start: () ->
    @current = @screens[0]
    @current.load()

  next: () ->
    @current.unload()
    @index += 1
    @current = @screens[@index]
    @current.load()
