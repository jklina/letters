class HomeController < ApplicationController
  def index
    @letter = Letter.approved
  end
end
