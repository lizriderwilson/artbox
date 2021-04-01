class CategoriesController < ApplicationController

  # GET: /categories
  get "/categories" do
    redirect to "/supplies"
  end

  get "/categories/:slug" do
    @categories = Category.all
    @category = Category.find_by_slug(params[:slug])
    erb :"/categories/show"
  end

  get "/users/:slug/:category_slug" do
    @user = User.find_by_slug(params[:slug])
    @category = Category.find_by_slug(params[:category_slug])
    erb :"/categories/user_index"
  end
end
