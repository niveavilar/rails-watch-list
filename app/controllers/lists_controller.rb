class ListsController < ApplicationController
  def index
    @lists = List.all
    options = { width: 1000, height: 600, crop: :fill }
    @banner_url = Cloudinary::Utils.cloudinary_url('cinema_y074eh', options)
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render 'lists/show', status: :unprocessable_entity
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params)
    redirect_to list_path(@list)
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
