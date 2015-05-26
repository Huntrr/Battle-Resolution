$ = require('./lib/jquery.js')
require('./lib/jquery-ui.js')

module.exports = class Side
  constructor: (@statusElem, @charElem) ->
    @hidden = true
    @statusElem.css('display', 'none')
    @charElem.css('display', 'none')

    @nameElem = $('.name', @statusElem) # selects the name element, child of statusElem
    @levelElem = $('.level', @statusElem)
    @healthElem = $('.health', @statusElem)
    @statsElem = $('.status', @statusElem)

  show: (display = true) ->
    @hidden = !display
    if(!@hidden)
      @statusElem.show('slide', {duration: 1000})
      @charElem.show('drop', {duration: 1000, direction: 'up'})
    else
      @statusElem.hide('slide', {duration: 0})
      @charElem.hide('slide', {duration: 0})

  toggle: () ->
    @show @hidden

  hide: () ->
    @show false

  setImg: (dir) ->
    @charElem.html('<img src="' + dir + '" alt="Character Image" />')

  setName: (name) ->
    @nameElem.html(name)

  setLevel: (level) ->
    @levelElem.html('' + level)

  setStatus: (status) ->
    @statsElem.html(status)

  unsetStatus: () ->
    @setStatus('none')

  setCase: (cse) ->
    @healthElem.html('' + cse)
