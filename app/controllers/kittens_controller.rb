class KittensController < ApplicationController
  
  def index
    @kittens = Kitten.all
    respond_to do |format|
      format.html
      format.json { render json: @kittens }
    end
  end

  def show
    @kitten = Kitten.find(params[:id])
    if !@kitten.nil?
      respond_to do |format|
        format.html
        format.json { render json: @kitten }
      end
    else
      flash[:danger] = "That kitty does not exist!"
      redirect_to kittens_url
    end
  end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)
    if @kitten.save
      flash[:success] = "You made a kitty! =)"
      redirect_to kitten_path(@kitten)
    else
      flash[:danger] = "Uh-oh, no kitty was made =("
      redirect_to kittens_url
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update_attributes(kitten_params)
      flash[:success] = "You updated da kitteh"
      redirect_to @kitten
    else
      flash.now[:danger] = "Da kitty was not updated..."
      render 'edit'
    end
  end
  
  def destroy
    Kitten.find(params[:id]).destroy
    flash[:danger] = "You destroyed a kitty D="
    redirect_to kittens_url
  end

  private
    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
