class MainController < ApplicationController
  before_filter :authorize, :only => [:admin]

  def index
    @photos = Photograph.all_cached
    @featured_photo = Photograph.get_featured(params[:featured])

    if @photos.nil? or @photos.length == 0
      @title = "Gallery empty"
      flash[:notice] = "Gallery is still empty. Running import may resolve the problem."
    end
  end

  def about
  end

  def error
  end

  def admin
    @title = "Site Actions"
  end

end
