class SuppliesController < ApplicationController

  # index
  get "/supplies" do
    @supplies = Supply.all
    @categories = Category.all
    erb :"/supplies/index"
  end

  # new
  get "/supplies/new" do
    if logged_in?
      @categories = Category.all
      erb :"/supplies/new"
    else
      redirect to '/login'
    end
  end

  # create
  post "/supplies" do
    if logged_in?
      if params[:supply][:name] && params[:category][:name]
        @supply = Supply.new(name: params[:supply][:name], description: params[:supply][:description])
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

  get "/users/:slug/supplies" do
    @user = User.find_by_slug(params[:slug])
    erb :"/supplies/user_index"
  end

  # show
  get "/supplies/:id" do
    @supply = Supply.find(params[:id])
    erb :"/supplies/show"
  end

  # edit
  get "/supplies/:id/edit" do
    if logged_in?
      @supply = Supply.find(params[:id])
        if @supply.user == current_user
          @categories = Category.all
          erb :"supplies/edit"
        else
          redirect to "/supplies/#{params[:id]}"
        end
    else
        redirect to "/supplies/#{params[:id]}"
    end
    erb :"/supplies/edit"
  end

  # update
  patch "/supplies/:id" do
    if params[:supply][:name] && params[:category][:name]
      @supply = Supply.find_by(id: params[:id])
      if @supply.user == current_user
          @category = Category.find_or_create_by(name: params[:category][:name])
          @supply.update(name: params[:supply][:name], description: params[:supply][:description], category_id: @category.id)
          redirect to "/supplies/#{params[:id]}"
      else
          redirect to "/supplies/#{params[:id]}"
      end
    else
        redirect to "/supplies/#{params[:id]}/edit"
    end
  end

  # destroy
  delete "/supplies/:id/delete" do
    @supply = Supply.find(params[:id])
    if @supply
      if logged_in? && @supply.user == current_user
        @supply.delete
        redirect to "/users/#{current_user.slug}"
      else
          redirect to "/supplies/#{params[:id]}"
      end
    else
      redirect to "/supplies"
    end
  end

end
