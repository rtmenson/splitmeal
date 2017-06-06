class PartiesController < ApplicationController
  def index
    @parties = Party.all

    render("parties/index.html.erb")
  end

  def show
    @party = Party.find(params[:id])

    render("parties/show.html.erb")
  end

  def new
    @party = Party.new

    render("parties/new.html.erb")
  end

  def create
    @party = Party.new

    @party.size = 0
    @party.start_date = params[:start_date]
    @party.end_date = params[:end_date]
    @party.name = params[:name]

    save_status = @party.save

    if save_status == true
      redirect_to("/parties/#{@party.id}", :notice => "Party created successfully.")
    else
      render("parties/new.html.erb")
    end
  end

  def edit
    @party = Party.find(params[:id])

    render("parties/edit.html.erb")
  end

  def update
    @party = Party.find(params[:id])

    @party.size = params[:size]
    @party.start_date = params[:start_date]
    @party.end_date = params[:end_date]
    @party.name = params[:name]

    save_status = @party.save

    if save_status == true
      redirect_to("/parties/#{@party.id}", :notice => "Party updated successfully.")
    else
      render("parties/edit.html.erb")
    end
  end

  def destroy
    @party = Party.find(params[:id])

    @party.destroy

    if URI(request.referer).path == "/parties/#{@party.id}"
      redirect_to("/", :notice => "Party deleted.")
    else
      redirect_to(:back, :notice => "Party deleted.")
    end
  end
end
