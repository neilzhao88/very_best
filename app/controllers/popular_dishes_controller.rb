class PopularDishesController < ApplicationController
  def index
    @popular_dishes = PopularDish.all

    render("popular_dishes/index.html.erb")
  end

  def show
    @popular_dish = PopularDish.find(params[:id])

    render("popular_dishes/show.html.erb")
  end

  def new
    @popular_dish = PopularDish.new

    render("popular_dishes/new.html.erb")
  end

  def create
    @popular_dish = PopularDish.new

    @popular_dish.venue_id = params[:venue_id]
    @popular_dish.favorites_id = params[:favorites_id]

    save_status = @popular_dish.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/popular_dishes/new", "/create_popular_dish"
        redirect_to("/popular_dishes")
      else
        redirect_back(:fallback_location => "/", :notice => "Popular dish created successfully.")
      end
    else
      render("popular_dishes/new.html.erb")
    end
  end

  def edit
    @popular_dish = PopularDish.find(params[:id])

    render("popular_dishes/edit.html.erb")
  end

  def update
    @popular_dish = PopularDish.find(params[:id])

    @popular_dish.venue_id = params[:venue_id]
    @popular_dish.favorites_id = params[:favorites_id]

    save_status = @popular_dish.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/popular_dishes/#{@popular_dish.id}/edit", "/update_popular_dish"
        redirect_to("/popular_dishes/#{@popular_dish.id}", :notice => "Popular dish updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Popular dish updated successfully.")
      end
    else
      render("popular_dishes/edit.html.erb")
    end
  end

  def destroy
    @popular_dish = PopularDish.find(params[:id])

    @popular_dish.destroy

    if URI(request.referer).path == "/popular_dishes/#{@popular_dish.id}"
      redirect_to("/", :notice => "Popular dish deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Popular dish deleted.")
    end
  end
end
