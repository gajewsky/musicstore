class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]
  def home
    redirect_to albums_path if current_user
    @albums = Album.last(4)
  end

  def dashboard
    @albums = current_user.albums
    @purchased = Sale.where(buyer_email: current_user.email)
    @sales = Sale.where(seller_email: current_user.email)
  end
end
