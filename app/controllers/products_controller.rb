class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @reviews = @product.reviews.order(created_at: :desc)
    @enhanced_reviews = []
    @reviews.each do |review|
      user = User.find(review[:user_id])
      enhanced_review = {}
      enhanced_review[:review] = review
      enhanced_review[:user] = user[:name]
      @enhanced_reviews.push(enhanced_review)
    end
    puts ">>> enhanced_reviews: #{@enhanced_reviews[0]}"
  end

end
