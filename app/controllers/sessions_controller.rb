class SessionsController < ApplicationController
    def create
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user, status: :created
        else
            rendern json: {errors: 'username or password incorrect'}, status: :unauthorized
        end
    end

    def destroy
        session.delete :user_id
        head :no_content
    end
    private

end
