class MenuItemsController < ApplicationController
  def index
    @menu_items = MenuItem.all

    render("menu_items/index.html.erb")
  end

  def show
    @menu_item = MenuItem.find(params[:id])

    render("menu_items/show.html.erb")
  end

  def new
    @menu_item = MenuItem.new

    render("menu_items/new.html.erb")
  end

  def create
    @menu_item = MenuItem.new

    @menu_item.name = params[:name]
    @menu_item.image = params[:image]
    @menu_item.price = params[:price]

    save_status = @menu_item.save

    if save_status == true
      redirect_to("/menu_items/#{@menu_item.id}", :notice => "Menu item created successfully.")
    else
      render("menu_items/new.html.erb")
    end
  end

  def edit
    @menu_item = MenuItem.find(params[:id])

    render("menu_items/edit.html.erb")
  end

  def update
    @menu_item = MenuItem.find(params[:id])

    @menu_item.name = params[:name]
    @menu_item.image = params[:image]
    @menu_item.price = params[:price]

    save_status = @menu_item.save

    if save_status == true
      redirect_to("/menu_items/#{@menu_item.id}", :notice => "Menu item updated successfully.")
    else
      render("menu_items/edit.html.erb")
    end
  end

  def destroy
    @menu_item = MenuItem.find(params[:id])

    @menu_item.destroy

    if URI(request.referer).path == "/menu_items/#{@menu_item.id}"
      redirect_to("/", :notice => "Menu item deleted.")
    else
      redirect_to(:back, :notice => "Menu item deleted.")
    end
  end
end
