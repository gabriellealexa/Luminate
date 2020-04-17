class PagesController < ApplicationController

def index
    @user = User.find_by(id: session[:user_id])
end 

def welcome 
    @user = User.find(session[:user_id])
end 

private

def require_login
    return head(:forbidden) unless 
    session.include? :user_id
end 


end