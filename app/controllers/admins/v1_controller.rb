module Admins
  #
  class V1Controller < AdminsController
    before_action :authenticate_admins_v1_admin!
    respond_to :json
  end
end
