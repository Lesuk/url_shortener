class LinksController < ApplicationController
  before_action :ckeck_link, only: :show

  def create
    @link = current_user.links.build(links_params)
    if @link.save
      flash[:success] = "Your link created!"
      redirect_to current_user
    else
      flash[:danger] = "Fild can't be blank! Put your link in text field below."
      redirect_to current_user
    end
  end

  def show
    if params[:short_url]
      # @link = Link.find_by(short_url: params[:short_url]) @link already is
      @link.visited = true
      @link.save
      redirect_to @link.full_url
    end
  end

  private

    def links_params
      params.require(:link).permit(:full_url)
    end

    def ckeck_link
      @link = Link.find_by(short_url: params[:short_url])
      if @link.visited
        flash[:warning] = "Sorry, but you can't use this link, because this one was visited."
        redirect_to current_user
      end
    end
end
