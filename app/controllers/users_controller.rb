class UsersController < ApplicationController


    def index
        @users = User.all 
    end 

    def show
        @current_user = User.find_by(id: session[:user_id])
        @user = User.find(params[:id])
        @connection = Connection.new
    end 

    def new
        @user = User.new
        @errors = flash[:errors]
    end

    def create 
        @new_user = User.create(user_params)

        if @new_user.valid?
            redirect_to '/login'
        else
            flash[:errors] = @new_user.errors.full_messages
            redirect_to '/signup' 
        end
    end 

    def edit 
        @user = User.find_by(id: session[:user_id])
    end 

    def update 
        @user = User.find_by(id: session[:user_id])
        @user.update_attributes(user_params)
        redirect_to user_path(@user)
    end 

    def destroy
        @user = User.find(params[:id])
        @user.destroy 
        redirect_to users_path
    end 

    def matches
        @users = @current_user.matches
      end

    private

    def user_params 
        params.require(:user).permit!
    end 

    def current_user
        @find = User.find_by(id: session[:user_id])
      end


end 