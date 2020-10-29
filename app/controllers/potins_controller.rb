class PotinsController < ApplicationController
    def show
        if Potin.exists?(params[:id])
            @potins = Potin.find(params[:id])
            @likes = Like.where(potin_id: @potins.id).length
            if Like.where(user_id: session[:user_id], potin_id: params[:id]).length == 1
                @liked = Like.where(user_id: session[:user_id], potin_id: params[:id])[0]
            else
                @liked = false
            end
        else
            flash.alert = 'le potin demande n\'existe pas ou a ete supprime :(' 
            redirect_to '/'
        end

    end
    def new
        @potin = Potin.new
        if !session[:user_id]
            flash.alert = "vous devez etre connecte pour postter un potin"
            redirect_to '/user/new'
        end
    end
    def create
        @potin = Potin.new( 'title' => params[:title],
                            'content' => params[:content],
                            'user_id' => session[:user_id])
        if(@potin.save)
            flash.notice = "potin cree"
            redirect_to @potin
        end

    end
    def edit
        @potin = Potin.find(params[:id])
        if @potin.user_id != session[:user_id]
            flash.alert = "tu n'as point le droit d'editer cela, vil malandrin"
            redirect_to @potin
        end
    end
    def update
        @potin = Potin.find(params[:id])
        @potin.title = params[:title]
        @potin.content = params[:content]
        if(@potin.save)

            flash.notice = "potin mis a jour!"
            redirect_to @potin
        end
    end
    def destroy
        Potin.find(params[:id]).delete
        flash.notice = "potin supprime"
        redirect_to '/'
    end
end
