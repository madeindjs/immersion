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


  # DELETE /newsletters/1
  # DELETE /newsletters/1.json
  def destroy
    @newsletter.destroy
    flash[:success] = t('newsletter.destroy.success')
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
