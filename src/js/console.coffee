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

  nextPage: () ->
    while @elem.prop('scrollHeight') <= @elem.outerHeight() - 5 and @stream.length > 0
      @elem.append(@stream.substring(0,1))
      @stream = @stream.substring(1)

  put: (what, cb) ->
    @elem.html('')
    @stream = what

    # handles all the printing of streams, RPG style
    @default_rate = 30
    @refresh_rate = @default_rate

    $(document).bind 'keypress.console', (e) =>
      @nextPage()

    setTimeout(f = (=>
      if(@stream.length > 0)
        @elem.append(@stream.substring(0,1))
        @stream = @stream.substring(1) # splice the stream
        if(@elem.prop('scrollHeight') > @elem.outerHeight() - 5)
          # element is overflowing, time to wait for input
          message = '...'

          # go back enough characters to print ...
          cur = @elem.html()
          @stream = cur.substring(cur.length - (message.length + 2)) + @stream
          @elem.html(cur.substring(0, cur.length - (message.length + 2)))

          # go back to the previous word, so we don't cut off in the middle of a word
          cur = @elem.html()
          @stream = cur.substring(cur.lastIndexOf(' ')) + @stream
          @elem.html(cur.substring(0, cur.lastIndexOf(' ')))

          @elem.append(message)
          $(document).unbind '.console'
          @game.waitForInput (err) =>
            @refresh_rate = @default_rate
            $(document).bind 'keypress.console', (e) => @nextPage()
            @elem.html('')
            f()
        else
          setTimeout(f, @refresh_rate)
      else
        $(document).unbind '.console'
        @game.waitForInput (err) -> cb(null)
    ), @refresh_rate)
