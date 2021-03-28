class SuppliesController < ApplicationController

  # index
  get "/supplies" do
    erb :"/supplies/index"
  end

  # new
  get "/supplies/new" do
    if logged_in?
      erb :"/supplies/new"
    else
      redirect to '/login'
    end
  end

  # create
  post "/supplies" do
    if logged_in?
      if params[:supply][:name] && params[:category][:name]
        @supply = Supply.new(name: params[:supply][:name], description: params[:supply][:name])
        @supply.category = Category.find_or_create_by(name: params[:category][:name])
        @supply.user = current_user
        if @supply.save
            redirect to "/supplies/#{@supply.id}"
        else
            redirect to "/supplies/"
        end
      else
        redirect to "/supplies/new"
      end
    else
      redirect to '/login'
    end
  end

  # show
  get "/supplies/:id" do
    @supply = Supply.find(params[:id])
    erb :"/supplies/show"
  end

  # edit
  get "/supplies/:id/edit" do
    @supply = Supply.find(params[:id])
    erb :"/supplies/edit"
  end

  # update
  patch "/supplies/:id" do
    redirect "/supplies/:id"
  end

  # destroy
  delete "/supplies/:id/delete" do
    redirect "/supplies"
  end
end
