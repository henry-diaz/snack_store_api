module Users
  module V1
    #
    class ProductsController < Users::V1Controller
      # Our index action is public, authenticated and guest users can see our
      # product list
      skip_before_action :authenticate_users_v1_user!, only: [:index]

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

      # GET /users/v1/products
      def index
        # I want to return a list of products available (Stock > 0) to users
        # so we start the query building with this scope
        @products = Product.available
        # If we got a params[:sort_by_likes] we sort by likes and name
        # because we can get two or more products with the same likes amount
        if params[:sort_by_likes].present?
          @products = @products.order(product_likes_count: :desc, name: :asc)
        else
          @products = @products.order(name: :asc)
        end
        # If we got a params[:q] params, we search through PostgreSQL full text
        @products = @products.search(params[:q]) unless params[:q].blank?
        # And finally, we paginate the query, we set 10 results per page by default
        page = params[:page].to_i <= 0 ? 1: params[:page].to_i
        @products = @products.paginate(page: page, per_page: 10)

        # Now, our render will be a little different this time, we are gonna
        # response the body with our products list and in the headers we are gonna
        # put the pagination info, that we can use in the app to draw the pagination
        # links
        response.headers['pagination'] = {
          total_pages: @products.total_pages,
          current_page: @products.current_page.to_i
        }.to_json
        render json: @products.to_json(json_options)
      end

      private
        # We don't want to expose all fields of products table, so with this json
        # options we define which attributes and methods we are gonna expose to
        # our users
        def json_options
          {
            only: [:id, :name, :description, :stock, :price, :product_likes_count],
            methods: [:image_url] # We also want to return the image product url
          }
        end

    end
  end
end
