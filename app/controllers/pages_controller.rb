require_relative '../../lib/game.rb'

class PagesController < ApplicationController
  include Game

  def game
    @grid = generate_grid(9)
  end

  def score
    @grid = params[:grid]
    @attempt = params[:attempt]
    @translation = get_translation(@attempt)
    @time_taken = Time.now.to_time.to_i - params[:timestamp].to_i
    @translation = get_translation(@attempt)
    score_and_message = score_and_message(@attempt, @translation, @grid, @time_taken)
    @score = score_and_message[0]
    @message = score_and_message[1]
  end

end