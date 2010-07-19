class Game

  def initialize
    @winner = ''
    @score = [0, 0]
    @player1_score = 0
    @player2_score = 0
  end


  def result player_name, opponent_name, player_score, opponent_score
    game = {
            0 => {
                0  => [15, 0,  [15, 0 ], ''],
                15 => [15, 15, [15, 15], ''],
                30 => [15, 30, [15, 30], ''],
                40 => [15, 40, [15, 40], ''],
            },
            15 => {
                0  => [30, 0,  [30, 0 ], ''],
                15 => [30, 15, [30, 15], ''],
                30 => [30, 30, [30, 30], ''],
                40 => [30, 40, [30, 40], ''],
            },
            30 => {
                0  => [40, 0,  [40,  0], ''],
                15 => [40, 15, [40, 15], ''],
                30 => [40, 30, [40, 30], ''],
                40 => ['Deuce', 'Deuce', 'Deuce', ''],
           },
            40 => {
                0  => ['winner', 0 ,  "winner #{player_name}", player_name],
                15 => ['winner', 15,  "winner #{player_name}", player_name],
                30 => ['winner', 30,  "winner #{player_name}", player_name],
            },
            'Deuce' => {
                'Deuce' => ["advantage #{player_name}", "advantage #{player_name}", "advantage #{player_name}"]
            },
            "Advantage #{player_name}" => {
                "Advantage #{player_name}" => ["winner #{player_name}", 'Deuce', player_name]
            },
            "Advantage #{opponent_name}" => {
                "Advantage #{player_name}" => ['Deuce', 'Deuce', 'Deuce'],
            },
    }
    raise "couldnt find #{player_score}" unless game.has_key? player_score
    puts [player_name, opponent_name, player_score, opponent_score, game[player_score][opponent_score]].inspect
    return game[player_score][opponent_score]
  end

  def player1_score
    @player1_score, @player2_score, @score, @winner = result('Player 1', 'Player 2', @player1_score, @player2_score)
  end

  def player2_score
    @player2_score, @player1_score, @score, @winner = result('Player 2', 'Player 1', @player2_score, @player1_score)
  end

  def score
    @score
  end

  def winner
    @winner
  end
end
