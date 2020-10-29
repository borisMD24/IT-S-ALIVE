class PagesController < ApplicationController
    def index
        @potins = Potin.all
    end
    def signup
    end
    def create
    end

end
