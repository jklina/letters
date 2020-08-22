class HomeController < ApplicationController
  def index
    @letter = Letter.all
  end
end
