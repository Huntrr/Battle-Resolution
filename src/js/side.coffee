$ = require('./lib/jquery.js')

module.exports = class Side
  constructor: (@statusElem, @charElem) ->
    @hidden = true
    @statusElem.css('display': 'none')
    @charElem.css('display': 'none')

    @nameElem = $('.name', @statusElem) # selects the name element, child of statusElem
    @levelElem = $('.level', @statusElem)
    @healthElem = $('.health', @statusElem)

  show: (display = true) ->
    @hidden = !display
    @statusElem.css('display': if @hidden then 'none' else 'block')
    @charElem.css('display': if @hidden then 'none' else 'block')

  toggle: () ->
    @show @hidden

  hide: () ->
    @show false
