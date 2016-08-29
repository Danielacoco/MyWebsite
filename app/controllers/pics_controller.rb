class PicsController < ApplicationController
  before_action :set_pic, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @pics = Pic.all.order("created_at DESC").paginate(:page => params[:page], :per_page=> 15)
  end

  def show
  end

  def new
    @pic = current_user.pics.build
  end

  def edit
  end

 
  def create
    @pic = current_user.pics.build(pic_params)

    if @pic.save
      redirect_to @pic, notice: 'Pic was successfully created.'

    else
      render :new 
    end
  end

  def update
    if @pic.update(pic_params)
      redirect_to @pic, notice: 'Pic was successfully updated.' 
    else
      render :edit 
    end
  end


  def destroy
    if current_user.try(:admin?)
      @pic.destroy
      redirect_to pics_url, notice: 'Pic was successfully destroyed.' 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pic
      @pic = Pic.find_by(id: params[:id])
    end

    def correct_user
      @pic = current_user.pics.find_by(id: params[:id])
      redirect_to pics_path, notice: "You don't have authorization to perform this action" if @pic.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pic_params
      params.require(:pic).permit(:description, :image)

    end
end
