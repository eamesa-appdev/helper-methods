class AlbumsController < ApplicationController
  def new
    @album = Album.new
  end

  def index
    @albums = Album.order( created_at: :desc )

    respond_to do |format|
      format.json do
        render json: @list_of_albums
      end

    format.html
    end
  end

  def show
    @album = Album.find(params.fetch(:id))
  end

  def create

    album_attributes = params.require(:album).permit(:title, :artist)

    @album = Album.new(album_attributes)

    if @album.valid?
      @album.save
      redirect_to albums_url, notice: "Album created successfully."
    else
      render "new"
    end
  end

  def edit
    @album = Album.find(params.fetch(:id))
  end

  def update #not updated
    album = Album.find(params.fetch(:id))

    album.title = params.fetch(:title)
    album.artist = params.fetch(:artist)

    if album.valid?
      album.save
      redirect_to album_url(album), :notice => "Album updated successfully."
    else
      redirect_to album_url(album), :alert => "Album failed to update successfully."
    end
  end

  def destroy
    @album = Album.find(params.fetch(:id))

    @album.destroy

    redirect_to albums_url, :notice => "Album deleted successfully."
  end
end
