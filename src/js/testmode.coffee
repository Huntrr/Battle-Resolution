$ = require 'lib/jquery.js'
Player = require 'debaters/player.coffee'
Battle = require './battle.coffee'

module.exports = class Test
  constructor: (@game) ->
    config = require './testmode-conf.coffee'
    # ---------------------
    # DEFINE THE ATTRIBUTES
    # ---------------------
    @name = config.name
    @level = config.level
    @health = config.health
    @clash = config.clash
    @presentation = config.presentation
    @organization = config.organization
    @civility = config.civility
    @cross = config.cross

    # ----------------
    # DEFINE THE MOVES
    # ----------------
    @moves = config.moves

    # --------------------
    # DEFINE THE OPPONENTS
    # --------------------
    @opponents = config.opponents









  run: () ->
    @setupPlayer()
    @addMoves()
    @addOpponents()

  setupPlayer: () ->
    @player = new Player(@game, @name, 'boy')
    @game.setPlayer @player
    @game.player.setName @name

    @player.level = @level
    @player.startingCase = @health
    @player.startingClash = @clash
    @player.startingPresentation = @presentation
    @player.startingOrganization = @organization
    @player.startingCivility = @civility
    @player.startingCross = @cross
  
  addMoves: () ->
    for Move in @moves
      move = new Move()
      @player.addMove move
  
  addOpponents: () ->
    for opp in @opponents
      @game.addScreen(new Battle(@game, opp, 'OPENING TEXT',
                                'PLAYER WINS', 'PLAYER LOSES', [])
      )
