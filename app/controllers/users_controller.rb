class UsersController < ApplicationController
  def index
    @user = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
        @user = User.new(
        uid: params[:user][:uid],
        password: params[:user][:password],
        password_confirmation: params[:user][:password_confirmation])
        if  User.find_by(uid: params[:user][:uid]) ==nil
          @user.save
          redirect_to '/' #=>一覧ページにリダイレクトする
        else
          render 'error'
        end
          
        
  end
  
  def edit
        @user = User.find(params[:id])
       
        
  end
    def update
        @user = User.find(params[:id])
        
        
        @user.update(message: params[:user][:message])
        redirect_to '/'
    end
    
    def destroy
        user = User.find(params[:id])
       
        user.destroy
        redirect_to '/'
    end
    
end
