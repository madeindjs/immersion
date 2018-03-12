class NewsletterSubscriptionsController < ApplicationController

  # POST /newsletters
  # POST /newsletters.json
  def create
    @subscription = NewsletterSubscription.new(newsletter_subscription_params)

    if @subscription.save
      flash[:success] = t('newsletter_subscription.create.success')
      redirect_to home_url
    else
      flash[:danger] = t('newsletter_subscription.create.error')
      render :new
    end
  end


  # GET /unsubscribe/hash
  def unsubscribe
    if subscription = NewsletterSubscription.find_by(unsubscribe_link: params[:hash])
      subscription.unsubscribe
      flash[:success] = t('newsletter_subscription.unsubscribe.success')
    else
      flash[:danger] = t('newsletter_subscription.unsubscribe.danger')
    end

    redirect_to home_url
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def newsletter_subscription_params
    params.require(:newsletter_subscription).permit(:email)
  end
end
