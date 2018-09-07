module Admins
  module V1
    #
    class ProductsController < Admins::V1Controller
      before_action :set_object, only: %i[update destroy]

      # POST /admins/v1/products
      def create
        @product = Product.new object_params
        if @product.save
          render json: @product.to_json,
                 status: :created
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      # PATCH /admins/v1/products/:id
      # You can change any of the fields of the product, I know the requirement
      # say modify only the price, but we're gonna use a normal update
      # action to change any attributes instead. We can always change object_params
      # to permits less fields (or more fields)
      def update
        @product.assign_attributes object_params.reject{|_, v| v.blank?}
        # In a normal app we have a pre filled form of the object to update,
        # so when we do a PATCH (or PUT) we send all the attributes again,
        # in the API we permit to send any field to update, so we need to remove
        # all the blank params of the object to prevent validations triggers of
        # attributes that we don't send to update
        if @product.save
          render json: @product.to_json
        else
          render json: @product.errors, status: :unprocessable_entity
        end
      end

      # DELETE /admins/v1/products/:id
      def destroy
        # Destroy the product and return a 200 OK header
        @product.destroy
        render status: 200
      end

      private
        # Only allow a trusted parameter "white list" through.
        def object_params
          params.require(:product).permit(:name, :description, :stock, :price, :image)
        end

        # find object
        def set_object
          @product = Product.find(params[:id])
        end
    end
  end
end
