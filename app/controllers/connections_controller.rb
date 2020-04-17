class ConnectionsController < ApplicationController

def index
  @current_user = User.find_by(id: session[:user_id])
        @connections = @current_user.matches
    
end 


def new
  @connection = Connection.new
end

def create
    @current_user = User.find_by(id: session[:user_id])
    @connection = Connection.new
    @connection.admirer_id = @current_user.id
    @connection.sweetheart_id = params[:id]
    @connection.status = "pending"
    @connection.save
    redirect_to user_path(@connection.sweetheart_id)
end 

private

def connection_params 
  params.require(:connection).permit!
end




end
