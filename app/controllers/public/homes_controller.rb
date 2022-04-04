class Public::HomesController < ApplicationController
  def after_sign_out_path_for(resource)
    root_path
  end

  layout 'public'

  def top
  end

  def about
  end
end
