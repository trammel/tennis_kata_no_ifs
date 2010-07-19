class Game

  attr_reader :winner, :score

  def initialize
    @winner = ''
    @score = [0, 0]
    @player1_score = 0
    @player2_score = 0
  end

  def player1_score
    @player1_score, @player2_score, @score, @winner = player_scores 'Player 1', 'Player 2', @player1_score, @player2_score, lambda { |s| s }
  end

  def player2_score
    @player2_score, @player1_score, @score, @winner = player_scores 'Player 2', 'Player 1', @player2_score, @player1_score, lambda { |s| s.reverse}
  end

  private

  def simple_increment_score new, score_modifier
    {
        0  => [new, 0,  score_modifier.call([new, 0 ]), ''],
        15 => [new, 15, score_modifier.call([new, 15]), ''],
        30 => [new, 30, score_modifier.call([new, 30]), ''],
        40 => [new, 40, score_modifier.call([new, 40]), ''],
    }
  end

  def player_scores player_name, opponent_name, player_score, opponent_score, score_modifier
    game = {
            0  => simple_increment_score(15, score_modifier),
            15 => simple_increment_score(30, score_modifier),
            30 => {
                0  => [40, 0,  score_modifier.call([40,  0]), ''],
                15 => [40, 15, score_modifier.call([40, 15]), ''],
                30 => [40, 30, score_modifier.call([40, 30]), ''],
                40 => ['Deuce', 'Deuce', 'Deuce', ''],
           },
            40 => {
                0  => ['winner', 0 ,  "winner #{player_name}", player_name],
                15 => ['winner', 15,  "winner #{player_name}", player_name],
                30 => ['winner', 30,  "winner #{player_name}", player_name],
            },
            'Deuce' => {
                'Deuce' => ["Advantage #{player_name}", "Advantage #{player_name}", "Advantage #{player_name}"]
            },
            "Advantage #{player_name}" => {
                "Advantage #{player_name}" => ["winner #{player_name}", 'Deuce', "winner #{player_name}", player_name]
            },
            "Advantage #{opponent_name}" => {
                "Advantage #{opponent_name}" => ['Deuce', 'Deuce', 'Deuce', ''],
            },
    }
    game[player_score][opponent_score]
  end

end
