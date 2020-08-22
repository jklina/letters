class Admin::LettersController < ApplicationController

  def index
    @letters = Letter.all
  end

  def edit
    find_letter
  end

  def update
    find_letter
    if @letter.update(letter_params)
      flash[:success] = "Letter was successfully updated."
      redirect_to admin_letters_path
    else
      render action: "edit"
    end
  end

  private

  def find_letter
    @letter = Letter.find(params[:id])
  end

  def letter_params
    params.require(:letter).permit(
      :title,
      :body,
    )
  end
end
