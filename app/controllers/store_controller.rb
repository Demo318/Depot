class StoreController < ApplicationController
  include IndexCounter
  before_action :update_index_counter, only: %i[ index ]

  def index
    @products = Product.order(:title)
    @time = Time.now.to_fs(:long)
  end
end
