$ = require './lib/jquery.js'

module.exports = class Screen
  constructor: (@game) ->

  load: () ->


  unload: () ->
    $('#background').html('')
    $('body').removeAttr('style')
    $('#background').removeAttr('style')
    $('.bar').removeAttr('style')
    $('.char').removeAttr('style')
    $('.message').removeAttr('style')
    $('.dialog').removeAttr('style')
    $('#page').removeAttr('style')

    @game.playerElem.hide()
    @game.opponentElem.hide()
    @game.dialog.hide()
    @game.console.hide()
