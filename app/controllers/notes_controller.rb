class NotesController < ApplicationController
  before_action :require_signin

  def index
    @notes = @user.notes
  end

  def new
    @note = Note.new
  end

  def create
    @note = @user.notes.new(note_params)
    if @note.save
      redirect_to user_notes_path(@note), notice: "Note successfully created"
    else
      render 'new'
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to user_notes_path(@user), notice: "Note has been updated successfully"
    else
      render 'edit'
    end
  end

  private
  def note_params
    params.required(:note).permit(:title, :description)
  end

end
