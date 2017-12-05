class DojosController < ApplicationController
    
    def home
        redirect_to '/dojos'
    end

    def index
        @dojos = Dojo.all
    end

    def new
        @errors = flash[:errors]
    end

    def create
        dojo = Dojo.new(dojo_params)
        if dojo.valid?
            dojo.save
            redirect_to '/dojos'
        else
            flash[:errors] = dojo.errors.full_messages
            redirect_to '/dojos/new'
        end
    end
    
    def show
        @dojo = Dojo.find(params[:id])
    end
    
    def edit
        @dojo = Dojo.find(params[:id])
        @errors = flash[:errors]
    end

    def update
        dojo = Dojo.find(params[:id])
        dojo.update(dojo_params)
        if dojo.valid?
            dojo.save
            redirect_to "/dojos/#{params[:id]}"
        else
            flash[:errors] = dojo.errors.full_messages
            redirect_to "/dojos/#{params[:id]}/edit"
        end
    end
    
    def delete
        Dojo.find(params[:id]).destroy
        redirect_to '/dojos'
    end
    
    private
    def dojo_params
        params.require(:dojo).permit(:branch, :street, :city, :state)
    end
end