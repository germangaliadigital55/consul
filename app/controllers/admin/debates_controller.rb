class Admin::DebatesController < Admin::BaseController
  include FeatureFlags
  include CommentableActions
  include HasOrders

  feature_flag :debates

  # has_filters %w{without_confirmed_hide all with_confirmed_hide}, only: :index
  has_orders %w[created_at]

  # def index
  #   @debates = Debate.only_hidden.send(@current_filter).order(hidden_at: :desc).page(params[:page])
  # end
  #
  # def index
  #   @debates = Debate.all.page(params[:page])
  # end

  private

    def resource_model
      Debate
    end

end
