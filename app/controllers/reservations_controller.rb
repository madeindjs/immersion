class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :check_login
  before_action :check_owner, only: [:destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = current_user.reservations.includes(:product)
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @product = Product.friendly.find(params[:id])
    @reservation = Reservation.new
  end


  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id

    respond_to do |format|
      if @reservation.save
        format.html {
          flash[:success] = t('reservation.created.success')
          redirect_to @reservation
        }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html {
          flash[:danger] = t('reservation.created.error')
          @product = @reservation.product
          render :new
        }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html {
        flash[:success] = t('reservation.destroy.success')
        redirect_to reservations_url
      }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def reservation_params
    params.require(:reservation).permit(:start_on, :product_id)
  end

  def check_owner
    render plain: '<div class="alert alert-danger">Vous n\'avez pas le droit d\'accéder à cette page</div>', status: 403 if current_user != @reservation.user
  end
end
