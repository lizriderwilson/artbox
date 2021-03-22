class UsersController < ApplicationController

    get '/signup' do
        erb :"users/new"
    end

    post '/signup' do
        "My username is #{params[:username]} and my email is #{params[:email]}"
        redirect to '/users/:id'
    end

    get '/users/:slug' do
        @user = User.all.find_by_slug(params[:slug])
        erb :"users/show"
    end

end