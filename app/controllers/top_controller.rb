class TopController < ApplicationController
    def main
        # render "login"
        @tweets = Tweet.all

    end
    def login 
        user = User.find_by(uid: params[:uid])#BCrypt::Password.createは暗号化
        pass = BCrypt::Password.new(user.pass)#こっちは認証処理
        if pass == params[:pass]
            session[:login_uid] = user
            redirect_to '/top/main'
            
        else
            render "error"
        end
            
    end
    
    def logout
        session.delete(:login_uid)
        render "login"
    end
    
end
