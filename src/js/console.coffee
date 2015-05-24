$ = require('./lib/jquery.js')
require './lib/jquery-ui.js'

module.exports = class Console
  constructor: (@game, @elem) ->
    @hidden = true
    @elem.css('display': 'none')
    @stream = ''

  show: (display = true) ->
    @hidden = !display
    if(@hidden)
      @elem.hide('fade', {duration: 0})
    else
      @elem.show('fade', {duration: 1000})

  toggle: () ->
    @show @hidden

  hide: () ->
    @show false

  put: (what, cb) ->
    @elem.html('')
    @stream = what

    # handles all the printing of streams, RPG style
    @default_rate = 30
    @refresh_rate = @default_rate

    $(document).bind 'keypress.console', (e) =>
      @refresh_rate = 0

    setTimeout(f = (=>
      if(@stream.length > 0)
        @elem.append(@stream.substring(0,1))
        @stream = @stream.substring(1) # splice the stream
        if(@elem.prop('scrollHeight') > @elem.outerHeight() - 5)
          # element is overflowing, time to wait for input
          message = '...'
          cur = @elem.html()
          @stream = cur.substring(cur.length - (message.length + 2)) + @stream
          @elem.html(cur.substring(0, cur.length - (message.length + 2)))
          @elem.append(message)
          $(document).unbind '.console'
          @game.waitForInput (err) =>
            @refresh_rate = @default_rate
            $(document).bind 'keypress.console', (e) => @refresh_rate = 0
            @elem.html('')
            f()
        else
          setTimeout(f, @refresh_rate)
      else
        $(document).unbind '.console'
        @game.waitForInput (err) -> cb(null)
    ), @refresh_rate)
