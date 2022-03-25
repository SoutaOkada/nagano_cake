class Admin::GenresController < ApplicationController
  layout 'admin'

  def index
    @genres = Genre.all
  end

  def create
  end

  def edit
  end

  def update
  end

end
