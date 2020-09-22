class Admin::LettersController < ApplicationController
  before_action :authenticate_user!

  def index
    @letters = Letter.all.order(created_at: :desc)
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
      :approved,
      :body,
      :summary,
    )
  end
end
