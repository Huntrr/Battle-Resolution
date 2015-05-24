$ = require('./lib/jquery.js')

module.exports = class Console
  constructor: (@game, @elem) ->
    @hidden = true
    @elem.css('display': 'none')
    @stream = ''

  show: (display = true) ->
    @hidden = !display
    @elem.css('display': if @hidden then 'none' else 'block')

  toggle: () ->
    @show @hidden

  hide: () ->
    @show false

  put: (what, cb) ->
    @elem.html('')
    @stream = what

    # handles all the printing of streams, RPG style
    refresh_rate = 20
    setTimeout(f = (=>
      if(@stream.length > 0)
        @elem.append(@stream.substring(0,1))
        if(@elem.prop('scrollHeight') > @elem.outerHeight() - 5)
          # element is overflowing, time to wait for input
          message = '...'
          cur = @elem.html()
          @stream = cur.substring(cur.length - (message.length + 2 )) + @stream
          @elem.html(cur.substring(0, cur.length - (message.length + 2)))
          @elem.append(message)
          @game.waitForInput (err) =>
            @elem.html('')
            f()
        else
          @stream = @stream.substring(1) # splice the stream
          setTimeout(f, refresh_rate)
      else
        cb(null)
    ), refresh_rate)
