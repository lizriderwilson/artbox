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
    get "/users/:slug" do
        @user = User.find_by_slug(params[:slug])
        erb :"users/show"
    end

    #edit
    get "/users/:slug/edit" do
        if logged_in?
            @user = User.find_by_slug(params[:slug])
            if @user == current_user
                erb :"users/edit"
            else
                redirect to "/users/#{params[:slug]}"
            end
        else
            redirect to "/users/#{params[:slug]}"
        end
    end

    #update
    patch "/users/:slug" do
        if params[:user][:password] == params[:user][:password_confirmation] && params[:user][:username] && params[:user][:email] && params[:user][:password]
            @user = User.find_by_slug(params[:slug])
            if @user && @user == current_user
                @user.update(name: params[:user][:name], username: params[:user][:username], email: params[:user][:email], password: params[:user][:password], location: params[:user][:location], twitter: params[:user][:twitter], instagram: params[:user][:instagram], bio: params[:user][:bio], icon: params[:user][:icon])
                redirect to "/users/#{params[:slug]}"
            else
                redirect to "/users/#{params[:slug]}/edit"
            end
        else
            redirect to "/users/#{params[:slug]}/edit"
        end
    end

    get "/users/:slug/confirm_delete" do
        if logged_in? && current_user == User.find_by_slug(params[:slug])
            erb :"/users/confirm"
        else
            redirect to "/users/#{params[:slug]}"
        end
    end

    # destroy
    delete "/users/:slug/delete" do
        redirect "/supplies"
    end

end