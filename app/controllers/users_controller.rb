class UsersController < ApplicationController

    # skip_before_action :authorize, only: :create


    def index 
        users = User.all 
        render json: users 
    end

    def create
        user = User.create(user_params)
        if user.valid?
          render json: user, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end
    

    def show 
        user = User.find(session[:user_id])
        render json: user
    end

    private 

    def user_params
        params.permit(:username, :password, :password_confirmation, :bio)
    end


end
