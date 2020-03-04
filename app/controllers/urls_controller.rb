class UrlsController < ApplicationController

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    @url.save
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end

  def show
    @url = Url.find_by slug: params[:slug]
    not_found if @url.nil?
    redirect_to @url.url
  end

   
  private
  def url_params
    params.require(:url).permit(:url)
  end
end