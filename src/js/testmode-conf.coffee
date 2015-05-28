module.exports =
  # ---------------------
  # SET TRUE WHEN TESTING
  # ---------------------
  enabled: true

  # ---------------------
  # DEFINE THE ATTRIBUTES
  # ---------------------
  name: 'TESTY MCTESTYPANTS'
  level: 15
  health: 5
  clash: 5
  presentation: 5
  organization: 5
  civility: 5
  cross: 5

  # ----------------
  # DEFINE THE MOVES
  # ----------------
  moves: [
    require 'moves/flourish.coffee'
    require 'moves/clash.coffee'
    require 'moves/sandal.coffee'
  ]

  # --------------------
  # DEFINE THE OPPONENTS
  # --------------------
  opponents: [
    require 'debaters/complexity-rubric.coffee'
    require 'debaters/novice.coffee'
  ]
