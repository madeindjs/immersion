class PagesController < ApplicationController

  def home
    @products = Product.includes(:user).all
  end

end
