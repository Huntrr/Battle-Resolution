$ = require 'lib/jquery.js'
Player = require 'debaters/player.coffee'
Battle = require './battle.coffee'

module.exports = class Test
  constructor: (@game) ->
    # ---------------------
    # DEFINE THE ATTRIBUTES
    # ---------------------
    @name = 'TESTER MCTESTYPANTS'
    @level = 15
    @health = 5
    @clash = 5
    @presentation = 5
    @organization = 5
    @civility = 5
    @cross = 5

    # ----------------
    # DEFINE THE MOVES
    # ----------------
    @moves = [
      require 'moves/flourish.coffee'
      require 'moves/clash.coffee'
      require 'moves/cross.coffee'
      require 'moves/shout.coffee'
    ]

    # --------------------
    # DEFINE THE OPPONENTS
    # --------------------
    @opponents = [
      require 'debaters/agressive-novice.coffee'
      # require 'debaters/novice.coffee'
    ]

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
