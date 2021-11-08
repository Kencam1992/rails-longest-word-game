class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('a'..'z').to_a.sample }
  end

  def score
    dictionary(params['play'])
  end

  private

  def word_check
    if dictionary(params['play']) && response(params['play']) == true
      'Congratulations! You Win!'
    else
      'You failed, try again!'
    end
  end

  def dictionary(check_word)
    url = "https://wagon-dictionary.herokuapp.com/#{check_word}"
    response = JSON.parse(URI.open(url).read)
    response['found']
  end
end
