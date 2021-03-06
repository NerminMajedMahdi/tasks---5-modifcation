class ProductsController < ApplicationController
   before_action :set_product, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!, except: [:index, :show]
 
 
  # GET /products/1
  # GET /products/1.json
  def show
  @comments = @product.comments.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
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

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
end
def index
    if params[:q]
      search_term = params[:q]
      @products = Product.search(search_term)
    else
      @products = Product.all
    end
end

private

  def comment_params
    params.require(:comment).permit(:user_id, :body, :rating)
  end



  private
    # Use callbacks to share common setup or constraints between actions.
   def set_product
      @product = Product.find(params[:id])
end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :image_url, :color)
    end
end
