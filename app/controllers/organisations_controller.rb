class OrganisationsController < ApplicationController
  # GET /organisations
  # GET /organisations.json
  def index
    @organisations = Organisation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @organisations }
    end
 
  def new
  end

  def create
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  end
end
