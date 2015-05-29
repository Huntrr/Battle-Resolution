module.exports =
  # ---------------------
  # SET TRUE WHEN TESTING
  # ---------------------
  enabled: false

  # ---------------------
  # DEFINE THE ATTRIBUTES
  # ---------------------
  name: 'TESTY MCTESTYPANTS'
  level: 15
  health: 3
  clash: 5
  presentation: 3
  organization: 3
  civility: 5
  cross: 3

  # ----------------
  # DEFINE THE MOVES
  # ----------------
  moves: [
    require 'moves/flourish.coffee'
    require 'moves/clash.coffee'
    require 'moves/sandal.coffee'
    require 'moves/shout.coffee'
  ]

  # --------------------
  # DEFINE THE OPPONENTS
  # --------------------
  opponents: [
    require 'debaters/captain.coffee'
  ]
