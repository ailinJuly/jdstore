class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
before_action :admin_required

layout "admin"

  def index
    @products = Product.all.recent

  end
  def show
    @product = Product.find_by_friendly_id!(params[:id])
  end
  def new
    @product = Product.new
    @photo = @product.photos.build #for multi-pics
    @categories = Category.all.map {|c| [c.name,c.id]}
  end

  def edit
    @product = Product.find_by_friendly_id!(params[:id])
    @categories = Category.all.map { |c| [c.name, c.id] }

  end
  def create
    @product = Product.new(product_params)
    @product.category_id = params[:category_id]

    if @product.save
        if params[:photos] != nil
           params[:photos]['avatar'].each do |a|
             @photo = @product.photos.create(:avatar => a)
           end
        end
    redirect_to admin_products_path
    else
    render :new
    end
  end

  def update
    @product = Product.find_by_friendly_id!(params[:id])

    @product.category_id = params[:category_id]
      if  params[:photos] != nil
          @product.photos.destroy_all #need to destroy old pics first

          params[:photos]['avatar'].each do |a|
            @picture = @product.photos.create(:avatar => a)
          end

        @product.update(product_params)
        redirect_to admin_products_path
      elsif @product.update(product_params)
        redirect_to admin_products_path
      else
        render :edit
      end
  end

  def destroy
    @product =Product.find_by_friendly_id!(params[:id])
    @product.destroy
    redirect_to admin_products_path
      flash[:alert]="DELETED!"

  end

  private
    def product_params
      params.require(:product).permit(:title, :description, :price, :quantity, :image, :category_id,:friendly_id)
    end

end
