module Users
  module V1
    #
    class ProductsController < Users::V1Controller

      # GET /users/v1/products/:id/like
      def like
        # I imagine a like icon link, that calls through ajax this action
        # so I decided to do it a GET method, and in this action like or dislike
        # (remove the like) a product
        @product_like = ProductLike.where(product_id: params[:id], user_id: current_users_v1_user.id).first_or_initialize
        if @product_like.new_record?
          # The user doesn't like this product before, we try create the record
          if @product_like.save
            render json: {'success' => true, 'action' => 'like'},
              status: :created
          else
            # The product id doesn't exist, throw a success false and errors
            render json: {'success' => false, 'errors' => @product_like.errors},
              status: :unprocessable_entity
          end
        else
          # The user is gonna dislike this product, we destroy the existing record
          @product_like.destroy
          render json: {'success' => true, action: 'dislike'},
                 status: :ok
        end
      end

    end
  end
end
