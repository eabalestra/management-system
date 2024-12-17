class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  # GET /products
  def index
    @categories = Category.order(name: :asc).load_async
    @products = Product.with_attached_image_url

    filter_by_category if params[:category_id]
    filter_by_min_price if params[:min_price].present?
    filter_by_max_price if params[:max_price].present?
    filter_by_query if params[:query_text].present?

    order_by = Product::ORDER_BY.fetch(params[:order_by], { name: :asc })
    @products = @products.order(order_by).load_async

    @pagy, @products = pagy(@products, limit: 1)
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy!

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

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:code, :name, :description, :image_url, :stock_quantity, :last_price_update,
                                    :last_stock_update, :unit_cost, :unit_price, :tax_amount, :profit_margin,
                                    :supplier_id, :category_id)
  end

  def filter_by_category
    @products = @products.where(category_id: params[:category_id])
  end

  def filter_by_min_price
    @products = @products.where('unit_price >= ?', params[:min_price])
  end

  def filter_by_max_price
    @products = @products.where('unit_price <= ?', params[:max_price])
  end

  def filter_by_query
    @products = @products.search_full_text(params[:query_text])
  end
end
