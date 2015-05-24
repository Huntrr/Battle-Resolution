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
    @dialog = new Dialog(@, $('.dialog'))
    @console = new Console(@, $('.message'))

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

  prev: () ->
    @current.unload()
    @index -= if @index > 0 then 1 else 0
    @current = @screens[@index]
    @current.load()

  setOpponent: (opp) ->
    @opponent = opp
    @opponent.load()

  setPlayer: (play) ->
    @player = play
    @player.load()

  waitForInput: (cb) ->
    $(document).bind 'keypress.wait', (e) ->
      console.log e.which
      $(document).unbind '.wait'
      cb(null)
