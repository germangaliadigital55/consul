class Admin::CommentsController < Admin::BaseController
  include HasOrders
  # include HasFilters

  # has_filters %w[pending_flag_review all with_ignored_flag], only: :index
  has_orders %w[flags newest], only: :index

  def index
    # @comments = Comment.send(@current_filter).send("sort_by_#{@current_order}").page(params[:page])
    @comments = Comment.send("sort_by_#{@current_order}").page(params[:page])
  end

end
