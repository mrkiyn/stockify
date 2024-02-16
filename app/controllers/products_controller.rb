class ProductsController < ApplicationController
    def index
        @products = Product.all.order(:id)
    end

    def show
        @product = Product.find(params[:id])
    end

    def new
        @product = Product.new
    end

    def create
        #---  This is not working if turbo is on 
        @product = Product.new(product_params)

        # @product.product_name = params[:product_name]
        # @product.description = params[:description]
        # @product.image_url = params[:image_url]
        # @product.price = params[:price]
        # @product.quantity = params[:quantity]

        if @product.save
            redirect_to products_path
        else
            render :new
        end
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])
  
        if @product.update(product_params)
            redirect_to product_path(@product), notice: "Post was succesfully updated."
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @product = Product.find(params[:id])
        if  @product.destroy
            redirect_to products_path, notice: "Product was removed from the list.", success: true
        else
            redirect_to products_path, notice: "Something happened. Please try again", success: false
        end
    end


    private

    def product_params
        params.require(:product).permit(:product_name, :description, :image_url, :price, :quantity)
    end
end
