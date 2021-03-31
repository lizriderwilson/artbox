class CategoriesController < ApplicationController

  # GET: /categories
  get "/categories" do
    redirect to "/supplies"
  end

  get "/categories/:slug" do
    @category = Category.find_by_slug(params[:slug])
    erb :"/categories/show"
  end

  get "/users/:slug/:category_slug" do
    @user = User.find_by_slug(params[:slug])
    @category = Category.find_by_slug(params[:category_slug])
    erb :"/categories/user_index"
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
