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
        @supply = Supply.new(name: params[:supply][:name], description: params[:supply][:description])
        @supply.category = Category.find_or_create_by(name: params[:category][:name])
        @supply.user = current_user
        if @supply.save
            redirect to "/supplies/#{@supply.slug}"
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
  get "/supplies/:slug" do
    @supply = Supply.find_by_slug(params[:slug])
    erb :"/supplies/show"
  end

  # edit
  get "/supplies/:slug/edit" do
    if logged_in?
      @supply = Supply.find(params[:slug])
        if @supply.user == current_user
            erb :"supplies/edit"
        else
            redirect to "/supplies/#{params[:slug]}"
        end
    else
        redirect to "/supplies/#{params[:slug]}"
    end
    erb :"/supplies/edit"
  end

  # update
  patch "/supplies/:slug" do
    if params[:supply][:name] && params[:category][:name]
      @supply = Supply.find_by(name: params[:supply][:name])
      if @supply.user == current_user
          @category = Category.find_or_create_by(name: params[:category][:name])
          @supply.update(name: params[:supply][:name], description: params[:supply][:description], category_id: @category.id)
          redirect to "/supplies/#{params[:slug]}"
      else
          redirect to "/supplies/#{params[:slug]}/edit"
      end
    else
        redirect to "/supplies/#{params[:slug]}/edit"
    end
    redirect "/supplies/:slug"
  end

  # destroy
  delete "/supplies/:slug/delete" do
    redirect "/supplies"
  end
end
