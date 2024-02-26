class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    @time = Time.now.to_fs(:long)
  end
end
