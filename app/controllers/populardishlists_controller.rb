class PopulardishlistsController < ApplicationController
  def index
    @q = Populardishlist.ransack(params[:q])
    @populardishlists = @q.result(:distinct => true).includes(:venue).page(params[:page]).per(10)

    render("populardishlists/index.html.erb")
  end

  def show
    @populardishlist = Populardishlist.find(params[:id])

    render("populardishlists/show.html.erb")
  end

  def new
    @populardishlist = Populardishlist.new

    render("populardishlists/new.html.erb")
  end

  def create
    @populardishlist = Populardishlist.new

    @populardishlist.venue_id = params[:venue_id]
    @populardishlist.bookmarks_id = params[:bookmarks_id]

    save_status = @populardishlist.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/populardishlists/new", "/create_populardishlist"
        redirect_to("/populardishlists")
      else
        redirect_back(:fallback_location => "/", :notice => "Populardishlist created successfully.")
      end
    else
      render("populardishlists/new.html.erb")
    end
  end

  def edit
    @populardishlist = Populardishlist.find(params[:id])

    render("populardishlists/edit.html.erb")
  end

  def update
    @populardishlist = Populardishlist.find(params[:id])

    @populardishlist.venue_id = params[:venue_id]
    @populardishlist.bookmarks_id = params[:bookmarks_id]

    save_status = @populardishlist.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/populardishlists/#{@populardishlist.id}/edit", "/update_populardishlist"
        redirect_to("/populardishlists/#{@populardishlist.id}", :notice => "Populardishlist updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Populardishlist updated successfully.")
      end
    else
      render("populardishlists/edit.html.erb")
    end
  end

  def destroy
    @populardishlist = Populardishlist.find(params[:id])

    @populardishlist.destroy

    if URI(request.referer).path == "/populardishlists/#{@populardishlist.id}"
      redirect_to("/", :notice => "Populardishlist deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Populardishlist deleted.")
    end
  end
end
