class TricksController < ApplicationController
  def index
    @dog = Dog.find(params[:dog_id])
    @tricks = @dog.tricks.all
  end

  def new
    @dog = Dog.find(params[:dog_id])
  end

  def create
    dog = Dog.find(params[:dog_id])
    dog.tricks << Trick.create(tricks_params)
    redirect_to "/dogs/#{dog.id}/tricks"
  end

  private
    def tricks_params
      params.permit(:title, :dog_id)
    end
end