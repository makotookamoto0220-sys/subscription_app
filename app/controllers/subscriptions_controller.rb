class SubscriptionsController < ApplicationController
    before_action :authenticate_user!
  def index
  @subscriptions = current_user.subscriptions
  end

  def show
    @subscription = Subscription.find(params[:id])
  end

  def new
    @subscription = current_user.subscriptions.build
  end

  def create
    @subscription = current_user.subscriptions.build(subscription_params)
    if @subscription.save
       redirect_to @subscription, notice: "登録しました"
    else
    render :new, status: :unprocessable_entity
    end
  end

  def edit
    @subscription = Subscription.find(params[:id])
  end
 def update
      @subscription = Subscription.find(params[:id])
  if @subscription.update(subscription_params)
    redirect_to @subscription, notice: "更新しました"
  else
    render :edit, status: :unprocessable_entity
  end
  end

  def destroy
  @subscription = Subscription.find(params[:id])
  @subscription.destroy
  redirect_to subscriptions_path, notice: "削除しました"
end


  private

  def subscription_params
  params.require(:subscription).permit(:name, :price, :payment_method, :payment_day, :active, :category, :memo)
  end
end
