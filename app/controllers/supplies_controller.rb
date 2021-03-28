class SuppliesController < ApplicationController

  # index
  get "/supplies" do
    erb :"/supplies/index"
  end

  # new
  get "/supplies/new" do
    erb :"/supplies/new"
  end

  # create
  post "/supplies" do
    binding.pry
    if params[:supply][:name] && params[:supply][:category_id]
      @supply = current_user.supplies.build(params[:supply])
      # @supply.user = current_user
      if @supply.save
          redirect to "/supplies/#{@supply.id}"
      else
          redirect to "/supplies/"
      end
    else
      redirect to "/supplies/new"
    end
  end

  # show
  get "/supplies/:id" do
    @supply = Supply.find(params[:id])
    erb :"/supplies/show"
  end

  # edit
  get "/supplies/:id/edit" do
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
