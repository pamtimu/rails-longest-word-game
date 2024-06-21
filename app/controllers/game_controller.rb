class GameController < ApplicationController
  def new
    #to create a new game
    #get the user input from form
    @letters = Array.new(10) { ("A".."Z").to_a[rand(26)] }
  end

  def score
    raise
   # @word = params[:word]
    #@score = compute_score(@word)
  end

  private

  def compute_score

  end

  def include?(word, letter)
  #match the user input to letters on the grid(if its not then have a message)
  word.chars.all? { | letter | word.count(letter) <= @letters.count(letter) }
  end

  def english_word?(word)
    response = open("http://https://dictionary.lewagon.com/#{word.downcase}")
    json = JSON.parse(response.read.to_s)
    json['found']['word'] unless json["Error"]
  end
  #check if the word is an english word(if not it should have a message)
end
