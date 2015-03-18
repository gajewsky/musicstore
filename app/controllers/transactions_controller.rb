class TransactionsController < ApplicationController
  def create
    album = Album.find_by!(slug: params[:slug])
    sale = album.sales.create(
      amount: album.price,
      buyer_email: current_user.email,
      seller_email: album.user.email,
      stripe_token: params[:stripeToken]
    )
    sale.process!
    if sale.finished?
      redirect_to pickup_url(guid: sale.guid), notice: 'Transaction successful!'
    else
      redirect_to album_path(album), notice: 'Something went wrong'
    end
  end

  def pickup
    @sale = Sale.find_by!(guid: params[:guid])
    @album = @sale.album
  end
end
