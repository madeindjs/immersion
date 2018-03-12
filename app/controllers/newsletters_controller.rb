class NewslettersController < ApplicationController
  before_action :set_newsletter, only: [:show, :edit, :update, :destroy, :send_emails]
  before_action :check_admin

  # GET /newsletters
  def index
    @newsletters = Newsletter.all
  end

  # GET /newsletters/1
  def show
    @subscription = NewsletterSubscription.new unsubscribe_link: "azerty"
  end

  def send_emails
    @newsletter.send_emails
    flash[:success] = t('newsletter.send.success')
    redirect_to @newsletter
  end

  # GET /newsletters/new
  def new
    @newsletter = Newsletter.new
  end

  # GET /newsletters/1/edit
  def edit
  end

  # POST /newsletters
  def create
    @newsletter = Newsletter.new(newsletter_params)
    @newsletter.user_id = current_user.id

    if @newsletter.save
      flash[:success] = t('newsletter.create.success')
      redirect_to @newsletter
    else
      flash[:danger] = t('newsletter.create.success')
      render :new
    end
  end

  # PATCH/PUT /newsletters/1
  def update
    if @newsletter.update(newsletter_params)
      flash[:success] = t('newsletter.update.success')
      redirect_to @newsletter
    else
      flash[:danger] = t('newsletter.update.success')
      render :edit
    end
  end

  # DELETE /newsletters/1
  def destroy
    @newsletter.destroy
    redirect_to newsletters_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_newsletter
    @newsletter = Newsletter.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def newsletter_params
    params.require(:newsletter).permit(:object, :content)
  end
end
