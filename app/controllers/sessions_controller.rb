class SessionsController < ApplicationController

    get '/login' do
        erb :'sessions/login'
    end

    post '/sessions' do
        login(params[:username], params[:password])
        redirect to "/users/#{User.find(session[:user_id]).slug}"
    end

    get '/logout' do
        logout
    end

end