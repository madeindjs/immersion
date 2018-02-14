class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :check_login, only: [:new, :create, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id

    respond_to do |format|
      if @product.save
        format.html {
          flash[:success] = "Votre produit a été crée."
          redirect_to @product
        }
        format.json { render :show, status: :created, location: @product }
      else
        format.html {
          flash[:danger] = "Une erreur est survenue."
          render :new
        }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html {
          flash[:success] = "Votre produit a été mis à jour."
          redirect_to @product
        }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html {
          flash[:danger] = "Une erreur est survenue."
          render :edit
        }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html {
        flash[:success] = "Votre produit a été supprimé."
        redirect_to products_url
      }
      format.json { head :no_content }
    end
  end

  private

  def check_owner
    render plain: '<div class="alert alert-danger">Vous n\'avez pas le droit d\'accéder à cette page</div>', status: 403 if current_user != @product.user
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :description, :price, :category_id)
  end
end
