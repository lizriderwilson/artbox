class CategoriesController < ApplicationController

  # GET: /categories
  get "/categories" do
    redirect to "/supplies"
  end

  # GET: /categories/5
  get "/categories/:id" do
    @category = Category.find(params[:id])
    erb :"/categories/show"
  end

  # GET: /categories/5/edit
  get "/categories/:id/edit" do
    erb :"/categories/edit"
  end

  # PATCH: /categories/5
  patch "/categories/:id" do
    redirect "/categories/:id"
  end

  # DELETE: /categories/5/delete
  delete "/categories/:id/delete" do
    redirect "/categories"
  end
end
