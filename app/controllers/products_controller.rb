class ProductsController < ApplicationController
  before_filter :authenticate_user! , only: [:favorite]


  def index
    @products = Product.all.recent
    if params[:category].blank?
      @products = Product.all
    else
      @category_id = Category.find_by(name: params[:category]).id
      @products = Product.where(:category_id => @category_id)
    end
  end


   def show
    @product = Product.find(params[:id])
    @photos = @product.photos.all
    @reviews = @product.reviews
    if @reviews.blank?
        @avg_review = 0
        @avg_look = 0
        @avg_price = 0
      else
        @avg_review = @reviews.average(:freshness).round(2)
        @avg_look = @reviews.average(:look).round(2)
        @avg_price = @reviews.average(:price).round(2)
      end
  end

   def add_to_cart
           @product = Product.find(params[:id])
     if !current_cart.products.include?(@product)
         flash[:notice]="你已经将 #{@product.title} 加入购物车"
         current_cart.add_product_to_cart(@product)
     else
         flash[:warning]= "你的购物车内已有此物品."
     end
      redirect_to :back

   end

   def favorite
     @product= Product.find(params[:id])
     type = params[:type]
     if type == "favorite"
     current_user.favorite_products << @product
     redirect_to :back

     elsif type == "unfavorite"
     current_user.favorite_products.delete(@product)
     redirect_to :back

     else
     redirect_to :back
     end
   end


end
