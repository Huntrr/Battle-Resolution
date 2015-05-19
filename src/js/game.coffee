$ = require('./lib/jquery.js')

module.exports = class Game
  constructor: (@background, @page, @menu) ->
    @screens = []
    @screens.push(@page)
    @index = 0

  load: (screen) ->
    @current.unload()
    @current = screen
    @current.load()

  addScreen: (screen) ->
    screens.push(screen)

  start: () ->
    @current = screens[0]
    @current.load()

  next: () ->
    @current.unload()
    index += 1
    @current = screens[index]
    @current.load()
