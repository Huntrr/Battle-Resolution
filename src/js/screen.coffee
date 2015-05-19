$ = require './lib/jquery.js'

module.exports = class Screen
  constructor: (@background, @page) ->

  load: () ->

  unload: () ->
    $('.bar').html('')
    $('.char').html('')
    $('.message').html('')
    $('.dialog').html('')
    @background.html('')

