class NotesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @notes = @user.notes
  end

  def new
    @user = User.find(params[:user_id])
    @note = Note.new
  end

  def create
    @user = User.find(params[:user_id])
    @note = @user.notes.new(note_params)
    if @note.save
      redirect_to user_notes_path(@note), notice: "Note successfully created"
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @note = Note.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
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
