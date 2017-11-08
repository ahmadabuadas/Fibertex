class OldersController < ApplicationController
before_action :set_older, only: [:edit, :update, :show, :destroy]

def index
  @olders = Older.all
end

def new
@older = Older.new
end

def edit
    @older = Older.find(params[:id])
end

def update
    @older = Older.find(params[:id])
    if @older.update(older_params)
        flash[:success] = "The older was successfully updated"
        redirect_to older_path(@older)
    else
        render 'edit'
    end
end

def create
#render plain: Params[:older].inspect 
@older = Older.new(older_params)
    if @older.save
        flash[:success] = "The order was successfully added"
        redirect_to older_path(@older)
    else
        render 'new'
    end
end

def show
    @older = Older.find(params[:id])
end

def destroy
@older = Older.find(params[:id])
@older.destroy
flash[:danger] = "The order was successfully deleted"
redirect_to olders_path
end

private
def set_older
    @older = Older.find(params[:id])
end

def older_params
params.require(:older).permit(:company, :item,
               :description, :machien, :location, :image)
end
end