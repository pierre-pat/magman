class MagiciansController < ApplicationController
  before_action :require_signin

  def index
    @magicians = @user.magicians
  end

  def new
    @magician = Magician.new
  end

  def create
    @magician = @user.magicians.new(magician_params)
    if @magician.save
      redirect_to @user, notice: "Magician added."
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    @magician = Magician.find(params[:id])
  end

  def update
    @magician = Magician.find(params[:id])
    if @magician.update(magician_params)
      redirect_to user_magicians_path(@user), notice: "Magician updated"
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
  def magician_params
    params.required(:magician).permit(:firstname, :lastname)
  end

end
