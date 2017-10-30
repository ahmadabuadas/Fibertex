class OldersController < ApplicationController

def new
@older = Older.new
end

def create
#render plain: Params[:older].inspect 
@older = Older.new(older_params)
    if @older.save
        flash[:notice] = "The order was successfully added"
        redirect_to older_path(@older)
    else
        render 'new'
    end
end

def show
    @older = Older.find(params[:id])
end

private
def older_params
params.require(:older).permit(:company, :item,
               :description, :machien, :location, :image)
end
end