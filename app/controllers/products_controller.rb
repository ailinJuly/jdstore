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
     @posts = @product.posts

    if @posts.blank?
      @avg_post = 0
      @avg_service = 0
      @avg_price = 0
    else
      @avg_post = @posts.average(:speed).round(2)
      @avg_service = @posts.average(:service).round(2)
      @avg_price = @posts.average(:price).round(2)
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
