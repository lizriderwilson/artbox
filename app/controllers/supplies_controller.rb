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
    redirect "/supplies"
  end

  # show
  get "/supplies/:id" do
    erb :"/supplies/show.html"
  end

  # edit
  get "/supplies/:id/edit" do
    erb :"/supplies/edit.html"
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
