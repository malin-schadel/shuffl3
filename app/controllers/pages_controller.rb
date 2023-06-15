class PagesController < ApplicationController
  def home
    @cards = Card.all.sample(3)
  end
end
