$ = require './../lib/jquery.js'
require './../lib/jquery-ui.js'
Screen = require './../screen.coffee'

module.exports = class Menu extends Screen
  constructor: (@game) ->
    super @game

  load: () ->
    super()
    $('body').css('background', 'url(\'./img/logo.png\')')
    $('body').css('background-size', 'cover')

    $('#background').append('<h1>PRESS ANY BUTTON</h1>')
    $('#background').css('position', 'fixed')
    $('#background').css('bottom', '20px')
    $('#background').css('width', '100%')

    @hidden = false
    @blink = () ->
      if(@hidden)
        $('#background').css('display', 'none')
      else
        $('#background').css('display', 'block')

      @hidden = !@hidden

    setInterval(@blink, 500)

    @game.waitForInput (err) =>
      @game.next()

  unload: () ->
    super()
    clearInterval(@blink)

