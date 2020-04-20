class OwnersController < ApplicationController
  def index
    @owners = Owner.all
  end

  def new
    @dog = Dog.find(params[:dog_id])
  end

  def create
    dog = Dog.find(params[:dog_id])
    owner = Owner.create(owner_params)
    ownership = Ownership.create(ownership_params)
    dog.ownerships << ownership
    owner.ownerships << ownership
    redirect_to owners_path
  end

  def adopt
    owner = Owner.find(params[:owner_id])
    dog = Dog.find(params[:dog_id])
    ownership = Ownership.create(ownership_params)
    ownership.length = 0
    owner.ownerships << ownership
    redirect_to owners_path
  end

  def adoption
    @owner = Owner.find(params[:owner_id])
    @dogs = Dog.all
  end

  def adopt_from_list
    owner = Owner.find(params[:owner_id])
    dog_names = params[:dogs].split(',')
    dog_names.each do |name|
      dog = Dog.find_by(name: name.strip)
      ownership = Ownership.create
      ownership.length = 0
      dog.ownerships << ownership
      owner.ownerships << ownership
    end
    redirect_to owners_path
  end

  private
    def owner_params
      params.permit(:name)
    end

    def ownership_params
      params.permit(:owner_id, :length, :dog_id)
    end
end