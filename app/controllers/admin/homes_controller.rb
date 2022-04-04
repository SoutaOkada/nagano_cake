class Admin::HomesController < ApplicationController
    def after_sign_out_path_for(resource)
        admin_session_path
    end

  layout 'admin'

  def top
  end
end
