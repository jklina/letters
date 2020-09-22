class LettersController < ApplicationController
  def new
    @letter = Letter.new
  end

  def create
    @letter = Letter.new(letter_params)
    if @letter.save
      flash[:notice] = "Thanks for submitting, we'll moderate it and get it up ASAP!"
      redirect_to root_path
    else
      flash[:alert] = "Unable to save as is!"
      render :new
    end
  end

  def show
    @letter = Letter.find(params[:id])
  end

  private

  def letter_params
    params.require(:letter).permit(:title, :body, :summary)
  end
end
