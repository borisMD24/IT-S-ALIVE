class SessionsController < ApplicationController
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash.notice = "salut #{user.first_name}"
            redirect_to "/"

        else
            flash.alert = 'Invalid email/password combination'
            redirect_to '/sessions/new'
        end
    end
    def destroy
      session.delete(:user_id)
      flash.notice = "t'es deco."
      redirect_to '/'
    end
end
