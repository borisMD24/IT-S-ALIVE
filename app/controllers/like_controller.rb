
class LikeController < ApplicationController
    def show
    end
    def new
    end
    def create
        @like = Like.new
        @like.user_id = session[:user_id]
        @like.potin_id = params[:potin_id]
        @like.save
    end
    def destroy
        Like.find_by(user_id: session[:user_id], potin_id: params[:potin_id]).delete
    end
end

# idee : utiliser la method render