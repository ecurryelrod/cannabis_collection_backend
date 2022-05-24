class SessionsController < ApplicationController
    def create
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            render json: UserSerializer.new(user)
        else
            render json: {alert: "Invalid email or password"}
        end
    end

    def get_current_user
        if logged_in?
            render json: UserSerializer.new(current_user)
        else
            render json: {alert: 'Please login to continue'}
        end
    end

    def destroy
        session.delete :user_id
        render json: {alert: 'Successfully Logged Out'}
    end
end
