class PagesController < ApplicationController

  def home
    @categories = Category.all
    @products = Product.includes(:user, :category).all.limit(20)
  end

  def contact
  end

end
