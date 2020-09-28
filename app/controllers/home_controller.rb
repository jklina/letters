class HomeController < ApplicationController
  def index
    @letter = Letter.approved.order(created_at: :desc)
  end
end
