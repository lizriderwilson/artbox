require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
    enable :sessions
    set :session_secret, ENV['SESSION_PASSWORD']
    set :strict_paths, false
  end

  get "/" do
    erb :welcome
  end

  helpers do 
    def current_user 
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end 

    def logged_in? 
      !!current_user
    end 
  end

end
