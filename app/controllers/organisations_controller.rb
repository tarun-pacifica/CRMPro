class OrganisationsController < ApplicationController
  before_filter :authorize

  def authorize
    if @auth
    else
      redirect_to login_path
    end
  end
  # GET /organisations
  # GET /organisations.json
  def index
    @organisations = Organisation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @organisations }
    end
end
 # GET /organisations/1
  # GET /organisations/1.json
  def show
    @organisation = Organisation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @organisation }
    end
  end

  # GET /organisations/new
  # GET /organisations/new.json
  def new
    @organisation = Organisation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @organisation }
    end
  end

  # GET /organisations/1/edit
  def edit
    @organisation = Organisation.find(params[:id])
  end

  # POST /organisations
  # POST /organisations.json
  def create
    @organisation = Organisation.new(params[:organisation])

    respond_to do |format|
      if @organisation.save
        format.html { redirect_to @organisation, notice: 'Organisation was successfully created.' }
        format.json { render json: @organisation, status: :created, location: @organisation }
       else
        format.html { render action: "new" }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /organisations/1
  # PUT /organisations/1.json
  def update
    @organisation = Organisation.find(params[:id])

    respond_to do |format|
      if @organisation.update_attributes(params[:organisation])
        format.html { redirect_to @organisation, notice: 'Organisation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organisations/1
  # DELETE /organisations/1.json
  def destroy
    @organisation = Organisation.find(params[:id])

    if @auth.is_admin?
      @organisation.destroy
      redirect_to organisations_path
    else
      redirect_to organisations_path
    end

  end

  def add_person
    @organisation = Organisation.find(params[:id])
  end

  def create_person
    @organisation = Organisation.find(params[:id])
    @organisation.people << Person.find(params[:person])
    @organisation.save
    redirect_to @organisation
  end
end
