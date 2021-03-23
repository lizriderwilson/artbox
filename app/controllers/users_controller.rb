class UsersController < ApplicationController

    #index
    get '/users' do
        erb :"users/index"
    end

    #new
    get '/signup' do
        if !logged_in?
            erb :"users/new"
        else
            redirect to '/supplies'
        end
    end

    #create
    post '/signup' do
        if params[:user][:password] == params[:user][:password_confirmation] && params[:user][:email] && params[:user][:username]
            @user = User.new(params[:user])
            if @user.save
                session[:user_id] = @user.id
                redirect to "/supplies"
            else
                redirect to "/signup"
            end
        else
            redirect to "/signup"
        end
    end

    #show
    get "/users/:id" do
        @user = User.find(params[:id])
        erb :"users/show"
    end

    #edit
    get "/users/:id/edit" do
        if logged_in?
            @user = User.find(params[:id])
            if @user == current_user
                erb :"users/edit"
            else
                redirect to "/users/#{params[:id]}"
            end
        else
            redirect to "/users/#{params[:id]}"
        end
    end

    #update
    patch "/users/:id" do
        if params[:user][:password] == params[:user][:password_confirmation] && params[:user][:username] && params[:user][:email] && params[:user][:password]
            @user = User.find(params[:id])
            if @user && @user == current_user
                @user.update(username: params[:user][:username], email: params[:user][:email], password: params[:user][:password])
                redirect to "/users/#{params[:id]}"
            else
                redirect to "/users/#{params[:id]}/edit"
            end
        else
            redirect to "/users/#{params[:id]}/edit"
        end
    end

end