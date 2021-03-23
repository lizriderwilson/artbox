class SessionsController < ApplicationController

    get '/login' do
        if logged_in?
            redirect to '/supplies'
        else
            erb :"/users/login"
        end
    end

    post '/login' do
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            binding.pry
            redirect to "/supplies"
        else
            redirect to '/login'
        end
    end

end