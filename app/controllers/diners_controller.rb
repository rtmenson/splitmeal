class DinersController < ApplicationController
  def index
    @diners = Diner.all

    render("diners/index.html.erb")
  end

  def show
    @diner = Diner.find(params[:id])

    render("diners/show.html.erb")
  end

  def new
    @diner = Diner.new

    render("diners/new.html.erb")
  end

  def create
    @diner = Diner.new

    @diner.party_id = params[:party_id]
    @diner.user_id = params[:user_id]

    save_status = @diner.save

    if save_status == true
      redirect_to("/parties/#{@diner.party_id}", :notice => "Diner created successfully.")
    else
      redirect_to(:back, :alert => "This diner is already party of your party.")
    end
  end

  def edit
    @diner = Diner.find(params[:id])

    render("diners/edit.html.erb")
  end

  def update
    @diner = Diner.find(params[:id])

    @diner.party_id = params[:party_id]
    @diner.user_id = params[:user_id]

    save_status = @diner.save

    if save_status == true
      redirect_to("/diners/#{@diner.id}", :notice => "Diner updated successfully.")
    else
      render("diners/edit.html.erb")
    end
  end

  def destroy
    @diner = Diner.find(params[:id])

    @diner.destroy

    if URI(request.referer).path == "/diners/#{@diner.id}"
      redirect_to("/", :notice => "Diner deleted.")
    else
      redirect_to(:back, :notice => "Diner deleted.")
    end
  end
end
