class NewslettersController < ApplicationController
  before_action :set_newsletter, only: [:show, :destroy]

  # POST /newsletters
  # POST /newsletters.json
  def create
    @newsletter = Newsletter.new(newsletter_params)

    if @newsletter.save
      flash[:success] = t('newsletter.create.success')
      redirect_to home_url
    else
      flash[:danger] = t('newsletter.create.error')
      render :new
    end
  end


  # GET /unsubscribe/hash
  def unsubscribe
    if newsletter = Newsletter.find_by(unsubscribe_link: params[:hash])
      newsletter.unsubscribe
      flash[:success] = t('newsletter.unsubscribe.success')
    else
      flash[:danger] = t('newsletter.unsubscribe.danger')
    end

    redirect_to home_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newsletter
      @newsletter = Newsletter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def newsletter_params
      params.require(:newsletter).permit(:email)
    end
end
