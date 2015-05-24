$ = require('./lib/jquery.js')

module.exports = class Dialog
  constructor: (@game, @elem) ->
    @hidden = true
    @elem.css('display': 'none')

  show: (display = true) ->
    @hidden = !display
    @elem.css('display': if @hidden then 'none' else 'block')

  toggle: () ->
    @show @hidden

  hide: () ->
    @show false
