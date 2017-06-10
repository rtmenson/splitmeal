class SharesController < ApplicationController

def create_multi_shares

  @sharers_user_ids = params[:sharers_user_ids]
  @menu_item = Order.where(:id => params[:order_id]).first.menu_item
  @proportion = 1.00/(@sharers_user_ids.count)

  @all_diners = []
  @sharers_user_ids.each do |sharer_user_id|
    @all_diners << Diner.all.where(:user_id => sharer_user_id, :party_id => params[:party_id]).first
  end

  #@all_diners << current_user.diners.where(:party_id => params[:party_id]).first

  @all_diners.each do |diner|
    Share.create(:diner_id => diner.id, :user_id => diner.user.id, :order_id => params[:order_id], :proportion => @proportion)
  end

  @order = Order.where(:id => params[:order_id]).first
  @order.is_shared = true
  @order.save

  redirect_back(:fallback_location => root_url, :notice => "The #{@order.menu_item.name} was successfully shared!")

end

  def index
    @shares = Share.all

    render("shares/index.html.erb")
  end

  def show
    @share = Share.find(params[:id])

    render("shares/show.html.erb")
  end

  def new
    @share = Share.new

    render("shares/new.html.erb")
  end

  def create
    @share = Share.new

    @share.order_id = params[:order_id]
    @share.proportion = params[:proportion]
    @share.user_id = params[:user_id]

    save_status = @share.save

    if save_status == true
      redirect_to("/shares/#{@share.id}", :notice => "Share created successfully.")
    else
      render("shares/new.html.erb")
    end
  end

  def edit
    @share = Share.find(params[:id])

    render("shares/edit.html.erb")
  end

  def update
    @share = Share.find(params[:id])

    @share.order_id = params[:order_id]
    @share.proportion = params[:proportion]
    @share.user_id = params[:user_id]

    save_status = @share.save

    if save_status == true
      redirect_to("/shares/#{@share.id}", :notice => "Share updated successfully.")
    else
      render("shares/edit.html.erb")
    end
  end

  def destroy
    @share = Share.find(params[:id])

    @share.destroy

    if Share.all.where(:order_id => @share.order.id) == nil
      @order.is_shared = false
      @order.save
    end

    if URI(request.referer).path == "/shares/#{@share.id}"
      redirect_to("/", :notice => "Share deleted.")
    else
      redirect_to(:back, :notice => "Share deleted.")
    end
  end
end
