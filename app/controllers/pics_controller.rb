class PicsController < ApplicationController
  before_action :set_pic, only: [:show, :edit, :update, :destroy]


  def index
    @pics = Pic.all
  end

  
  def show
  end

  def new
    @pic = Pic.new
  end

  def edit
  end

 
  def create
    @pic = Pic.new(pic_params)

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
    @pic.destroy
    redirect_to pics_url, notice: 'Pic was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pic
      @pic = Pic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pic_params
      params.require(:pic).permit(:description)
    end
end
