module Users
  #
  class V1Controller < UsersController
    before_action :authenticate_users_v1_user!
    respond_to :json
  end
end
