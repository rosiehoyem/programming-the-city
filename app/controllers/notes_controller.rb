class NotesController < ApplicationController
  def create
    @note = Note.new
    @note.create!(notes_params)
  end

  private

  def notes_params
    params.require(:note).permit(:text, :image, :parent_id, :parent_type)
  end
end