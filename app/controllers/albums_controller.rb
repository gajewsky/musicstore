class AlbumsController < ApplicationController
  respond_to :html, :json
  before_action :authenticate_user!,
                only: [:new, :edit, :create, :update, :destroy]
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  def index
    @albums = Album.where(availability: true)
  end

  def show
  end

  def new
    @album = Album.new
    respond_with(@album)
  end

  def edit
    authorize! :manage, @album
  end

  def create
    @album = current_user.albums.new(album_params)
    @album.save
    respond_with(@album)
  end

  def update
    authorize! :manage, @album
    @album.update(album_params)
    respond_with(@album)
  end

  def destroy
    authorize! :manage, @album
    @album.destroy
    respond_with(@album)
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album)
      .permit(:name, :author, :description, :price, :availability, :image, :resource)
  end
end
