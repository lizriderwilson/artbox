class CategoriesController < ApplicationController

  # GET: /categories
  get "/categories" do
    redirect to "/supplies"
  end

  # GET: /categories/5
  get "/categories/:slug" do
    @category = Category.find_by_slug(params[:slug])
    erb :"/categories/show"
  end

  # GET: /categories/5/edit
  get "/categories/:slug/edit" do
    erb :"/categories/edit"
  end

  # PATCH: /categories/5
  patch "/categories/:slug" do
    redirect "/categories/:slug"
  end

  # DELETE: /categories/5/delete
  delete "/categories/:slug/delete" do
    redirect "/categories"
  end
end
