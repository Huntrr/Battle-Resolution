$ = require('./lib/jquery.js')
require './lib/jquery-ui.js'

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

  change: (x, effect = 'fold') ->
    $('#mask').show(effect, {duration: 500, complete: () =>
      @current.unload()
      @index += x
      @current = @screens[@index]
      setTimeout () =>
        $('#mask').hide('fade', {duration: 500, complete: () ->
          # do nothing
        })
        @current.load()
      , 250
    })

  next: () ->
    @change 1

  prev: () ->
    @change -1

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

  pause: (ms, cb) ->
    setTimeout () ->
      cb(null)
    , ms
