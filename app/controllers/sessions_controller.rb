class SessionsController < ApplicationController


    def index 
        redirect_to root_path
    end


    def new
        
      end
      
      def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to welcome_path
        else
          redirect_to welcome_path #change to a welcome page
        end
      end

      def destroy
        session.delete(:email)
        @current_user = nil
      end

end 