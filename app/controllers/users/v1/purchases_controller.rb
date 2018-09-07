module Users
  module V1
    #
    class PurchasesController < Users::V1Controller
      # POST /users/v1/products/buy
      def create
        @purchase = Purchase.new object_params
        # The user that made the request is the user that buy the product
        @purchase.user = current_users_v1_user
        if @purchase.save
          render json: @purchase.to_json,
                 status: :created
        else
          render json: @purchase.errors,
                 status: :unprocessable_entity
        end
      end

      private
        # Only allow a trusted parameter "white list" through.
        def object_params
          params.require(:purchase).permit(:product_id, :quantity)
        end
    end
  end
end
