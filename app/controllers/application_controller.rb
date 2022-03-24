class ApplicationController < ActionController::Base
    def after_sign_out_path_for(resource)
        admin_session_path
    end
end
