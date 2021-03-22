class UsersController < ApplicationController

    get '/signup' do
        erb :"users/new"
    end

    post '/signup' do
        "My username is #{params[:username]} and my email is #{params[:email]}"
        # erb :"users/show"
    end

end