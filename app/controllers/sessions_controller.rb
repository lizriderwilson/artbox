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
            redirect to "/users/#{@user.slug}"
        else
            redirect to '/login'
        end
    end

    get "/logout" do 
        session.destroy 
        redirect to "/"
    end 

end