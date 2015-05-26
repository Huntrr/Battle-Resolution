$ = require('./lib/jquery.js')

module.exports = class Dialog
  constructor: (@game, @elem) ->
    @hidden = true
    @elem.css('display': 'none')

    @title = $('.title', @elem)
    @options = $('.options', @elem)

    @list = []
    @offset = 0
    @selected = 0

  show: (display = true) ->
    @hidden = !display
    @elem.css('display': if @hidden then 'none' else 'block')

  toggle: () ->
    @show @hidden

  hide: () ->
    @show false

  draw: () ->
    itemHeight = 80
    num = (@elem.height() - @title.height()) / itemHeight
    num = if num >= @list.length then @list.length - 1 else num

    while(@selected < @offset)
      @offset--
    while(@selected > @offset + num)
      @offset++
    console.log 'SELECTED: ' + @selected
    console.log 'OFFSET: ' + @offset
    @options.html('')
    for n in [0..num]
      cur = @offset + n
      @options.append('<li' + (if (cur is @selected) then ' class="selected">' else '>') + @list[cur][0] + '</li>')

  arrMenu: (title, options, cb) ->
    @offset = 0
    @selected = 0
    @title.html(title)
    @options.html('')
    
    @list = options
    @draw()

    # handles menu key presses
    $(document).bind 'keydown.menu', (e) =>
      #pressed up
      console.log 'KEY DOWN: ' + e.which
      if(e.which is 38 or e.which is 87 or e.which is 75)
        @selected = if @selected > 0 then @selected - 1 else @list.length - 1
        @draw()
      else if(e.which is 40 or e.which is 83 or e.which is 74)
        #press down
        @selected = if @selected < @list.length - 1 then @selected + 1 else 0
        @draw()

      #pressed enter key
      if(e.which is 13 or e.which is 32 or e.which is 39 or e.which is 68 or e.which is 76)
        $(document).unbind '.menu'
        @show false
        cb(null, @list[@selected][1])

      e.preventDefault()
    @show true
    
  menu: (title, options..., cb) ->
    @arrMenu(title, options, cb)
