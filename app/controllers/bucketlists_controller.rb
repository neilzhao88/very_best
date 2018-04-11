class BucketlistsController < ApplicationController
  before_action :current_user_must_be_bucketlist_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_bucketlist_user
    bucketlist = Bucketlist.find(params[:id])

    unless current_user == bucketlist.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Bucketlist.ransack(params[:q])
    @bucketlists = @q.result(:distinct => true).includes(:user, :bookmarks).page(params[:page]).per(10)

    render("bucketlists/index.html.erb")
  end

  def show
    @bookmark = Bookmark.new
    @bucketlist = Bucketlist.find(params[:id])

    render("bucketlists/show.html.erb")
  end

  def new
    @bucketlist = Bucketlist.new

    render("bucketlists/new.html.erb")
  end

  def create
    @bucketlist = Bucketlist.new

    @bucketlist.user_id = params[:user_id]

    save_status = @bucketlist.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bucketlists/new", "/create_bucketlist"
        redirect_to("/bucketlists")
      else
        redirect_back(:fallback_location => "/", :notice => "Bucketlist created successfully.")
      end
    else
      render("bucketlists/new.html.erb")
    end
  end

  def edit
    @bucketlist = Bucketlist.find(params[:id])

    render("bucketlists/edit.html.erb")
  end

  def update
    @bucketlist = Bucketlist.find(params[:id])

    save_status = @bucketlist.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/bucketlists/#{@bucketlist.id}/edit", "/update_bucketlist"
        redirect_to("/bucketlists/#{@bucketlist.id}", :notice => "Bucketlist updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Bucketlist updated successfully.")
      end
    else
      render("bucketlists/edit.html.erb")
    end
  end

  def destroy
    @bucketlist = Bucketlist.find(params[:id])

    @bucketlist.destroy

    if URI(request.referer).path == "/bucketlists/#{@bucketlist.id}"
      redirect_to("/", :notice => "Bucketlist deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Bucketlist deleted.")
    end
  end
end
