class SessionsController < ApplicationController
    def create
        user = User.find_by(email: params[:email])

        if user && user.authenticate(password: params[:password])
            session[:user_id] = user.id
            render json: UserSerializer.new(user)
        else
            render json: {alert: "Invalid email or password"}
        end
    end
end
