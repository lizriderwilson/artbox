class UsersController < ApplicationController

    #index
    get '/users' do
        erb :"users/index"
    end

    #new
    get '/signup' do
        erb :"users/new"
    end

    #create
    post '/users' do
        
    end

    #show
    get "/users/:id" do
        erb :"users/show"
    end

    #edit
    get "/users/:id/edit" do
        erb :"users/edit"
    end

    #update
    patch "/users/:id" do

    end

end