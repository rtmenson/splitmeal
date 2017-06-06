class SharesController < ApplicationController
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

    if URI(request.referer).path == "/shares/#{@share.id}"
      redirect_to("/", :notice => "Share deleted.")
    else
      redirect_to(:back, :notice => "Share deleted.")
    end
  end
end
