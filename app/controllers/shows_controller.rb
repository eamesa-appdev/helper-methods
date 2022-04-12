class ShowsController < ApplicationController
  def new
    @show = Show.new
  end

  def index
    @shows = Show.order( created_at: :desc )

    respond_to do |format|
      format.json do
        render json: @list_of_shows
      end

    format.html
    end
  end

  def show
    @show = Show.find(params.fetch(:id))
  end

  def create

    show_attributes = params.require(:show).permit(:title, :description)

    @show = Show.new(show_attributes)

    if @show.valid?
      @show.save
      redirect_to shows_url, notice: "Show created successfully."
    else
      render "new"
    end
  end

  def edit
    @show = Show.find(params.fetch(:id))
  end

  def update #not updated
    show = Show.find(params.fetch(:id))

    show.title = params.fetch(:title)
    show.description = params.fetch(:description)

    if show.valid?
      show.save
      redirect_to show_url(show), :notice => "Show updated successfully."
    else
      redirect_to show_url(show), :alert => "Show failed to update successfully."
    end
  end

  def destroy
    @show = Show.find(params.fetch(:id))

    @show.destroy

    redirect_to shows_url, :notice => "Show deleted successfully."
  end
end
