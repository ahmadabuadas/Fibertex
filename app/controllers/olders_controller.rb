class OldersController < ApplicationController
before_action :set_older, only: [:edit, :update, :show, :destroy]
before_action :require_user, except: [:index, :show]
before_action :require_same_user, only: [:edit, :update, :destroy]

def index
@olders = Older.paginate(page: params[:page], per_page: 10)
end

def new
@older = Older.new
end

def edit
end

def update
    
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
    @older.user = current_user
    if @older.save
        flash[:success] = "The order was successfully added"
        redirect_to older_path(@older)
    else
        render 'new'
    end
end

def show
    
end

def destroy

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

def require_same_user
    if current_user != @older.user
        flash[:danger] = "You can only edit or delete your own Orders"
        redirect_to root_path
    end
end

end