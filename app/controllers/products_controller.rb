class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    
    if @product.save
      if params[:product][:product_image].present?
        render :crop
      else
        redirect_to root_path, notice: 'Product was successfully created.'
      end
    else
      render :edit
    end
    
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    
    if @product.update(product_params)
      if params[:product][:product_image].present?
        render :crop
      else
        redirect_to root_path, notice: 'Product was successfully updated.'
      end
    else
      render :edit
    end
    
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :price, :product_image, :crop_x, :crop_y, :crop_w, :crop_h)
    end
end
