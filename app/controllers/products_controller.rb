class ProductsController < ApplicationController
  before_action :authenticate_user!

  def new
    @category = Category.find(params[:category_id])
  end

  def show
  
  end

  def edit
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])
  end

  def create
    @category = Category.find(params[:category_id])
    @product = @category.products.create(products_params)
    @product.user = current_user

    if @product.save
      flash[:notice] = "Product has been created"
      redirect_to category_path(@category)
    else
      flash[:notice] = "Product has not been created"
      redirect_to category_path(@category)
    end
  end

  def update
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])
    respond_to do |format|
      if @product.update(products_params)
        format.html { redirect_to category_url(@category), notice: "Product has been updated!" }
      else 
        format.html {redirect_to category_url(@category), alert: "Product has not been updated!"}
      end
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @product = @category.products.find(params[:id])
    @product.destroy
    redirect_to category_path(@category)
  end

  private

    def products_params
      params.require(:product).permit(:name, :model, :description, :category_id, :image, :manufacturer)
    end


end
