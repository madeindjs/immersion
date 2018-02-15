class PagesController < ApplicationController

  def home
    @categories = Category.all
    @products = Product.includes(:user).all
  end

end
