class KittensController < ApplicationController
  
  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      # Success!
    else
      # Failure
    end
  end

  def update
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def destroy
  end

  private
    def kitten_params
      
    end
end
