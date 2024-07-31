class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @checkout_session = current_user.payment_processor.checkout(
      mode: "subscription",
      locale: I18n.locale,
      line_items: [{
        price: params[:price],
        quantity: 1
      }],
      success_url: dashboard_index_url
    )
    redirect_to @checkout_session.url, allow_other_host: true, status: :see_other
  end

  def index
  end
end
