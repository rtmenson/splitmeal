class OrdersController < ApplicationController
  def index
    @orders = Order.all

    render("orders/index.html.erb")
  end

  def show
    @order = Order.find(params[:id])

    render("orders/show.html.erb")
  end

  def new
    @order = Order.new

    render("orders/new.html.erb")
  end

  def create
    @order = Order.new

    @order.menu_item_id = params[:menu_item_id]
    @order.party_id = params[:party_id]
    @order.is_shared = params[:is_shared]

    save_status = @order.save

    if save_status == true
      #redirect_to("/orders/#{@order.id}", :notice => "Order created successfully.")
      redirect_back(:fallback_location => root_url, :notice => "The #{@order.menu_item.name} was successfully created!")
    else
      render("orders/new.html.erb")
    end
  end

  def edit
    @order = Order.find(params[:id])

    render("orders/edit.html.erb")
  end

  def update
    @order = Order.find(params[:id])

    @order.menu_item_id = params[:menu_item_id]
    @order.party_id = params[:party_id]
    @order.is_shared = params[:is_shared]

    save_status = @order.save

    if save_status == true
      redirect_to("/orders/#{@order.id}", :notice => "Order updated successfully.")
    else
      render("orders/edit.html.erb")
    end
  end

  def destroy
    @order = Order.find(params[:id])

    @order.destroy

    if URI(request.referer).path == "/orders/#{@order.id}"
      redirect_to("/", :notice => "Order deleted.")
    else
      redirect_to(:back, :notice => "Order deleted.")
    end
  end
end
