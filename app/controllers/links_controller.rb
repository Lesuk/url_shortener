class LinksController < ApplicationController

  def create
    @link = current_user.links.build(links_params)
    @link.save
    redirect_to current_user
  end

  def show
    if params[:short_url]
      @link = Link.find_by(short_url: params[:short_url])
      redirect_to @link.full_url
      @link.visited = true
      @link.save
    end
  end

  private

    def links_params
      params.require(:link).permit(:full_url)
    end
end
