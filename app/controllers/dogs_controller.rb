class DogsController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def edit
    @dog = Dog.find(params[:id])
  end

  def create
    Dog.create(dog_params)
    redirect_to dogs_path
  end

  def update
    dog = Dog.find(params[:id])
    dog.update(dog_params)
    redirect_to dogs_path
  end

  def destroy
    dog = Dog.find(params[:id])
    dog.destroy
    redirect_to dogs_path
  end

  private
    def dog_params
      params.permit(:name, :breed, :age)
    end
end
