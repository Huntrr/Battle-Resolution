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

    @availableMoves = [] # moves available for picking for player

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
      console.log 'Moving to screen ' + @index
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
    @change(-1)

  setOpponent: (opp) ->
    @opponent = opp
    @opponent.load()

  setPlayer: (play) ->
    @player = play
    @player.load()

  levelUp: (cb) ->
    @player.level++
    @dialog.arrMenu 'LEVEL UP! You\'re speaker score is now ' + @player.level + '.
                    Please select a new move to add to your "special" skillset',
                    @availableMoves, (err, result) =>
                      @removeMove result.name
                      @player.addMove result
                      cb(err)

  # takes a string and finds the corresponding move in js/moves/[string].coffee
  # Adds that move to the list the player can choose from on level up
  addMove: (NewMove) ->
    move = new NewMove()
    @removeMove move.name
    @availableMoves.push([move.name, move])

  # Removes a move with name name from list
  # Only removes it if it exists. Otherwise does nothing
  removeMove: (name) ->
    for i in [0...@availableMoves.length]
      if @availableMoves[i][0] is name
        @availableMoves.splice i, 1
        @removeMove name
        return

  waitForInput: (cb) ->
    @gotInput = false
    $(document).bind 'keypress.wait', (e) =>
      if !@gotInput
        @gotInput = true
        console.log e.which
        $(document).unbind '.wait'
        cb(null)

  pause: (ms, cb) ->
    setTimeout () ->
      cb(null)
    , ms
