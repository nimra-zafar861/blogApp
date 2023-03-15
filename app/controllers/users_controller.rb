class UsersController < ApplicationController
     def index
    @user=User.all
  end

  def show
    @user=User.find(params[:id])
    
  end

  def new
    @user=User.new
  end
  def create
    @user=User.create(user_params) 
    if @user.save 
    redirect_to users_path 
    else 
      render :new ,status: :unprocessable_entity
    end
  end


  def edit
    @user=User.find(params[:id])
  end

  def update 
    @user=User.find(params[:id])
    @user.update(user_params)
    if @user.save 
      redirect_to users_path 
      else 
        render :new ,status: :unprocessable_entity
      end
    flash[:notice]="updated successfully"

  end
  def destroy 
    @user=User.find(params[:id])
    @user.destroy
    redirect_to users_path ,status: :see_others
  end

  private 
  def user_params
 params.require(:user).permit(:name,:country )
  end
end
