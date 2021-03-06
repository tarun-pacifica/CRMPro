class PeopleController < ApplicationController
  before_filter :check_if_logged_in, :except => [:new, :create]
  before_filter :check_if_admin, :only => [:destroy]

  # GET /people
  # GET /people.json
  def index

    if params[:searchname] && params[:searchname].present? 
      @people = Person.where(:name => params[:searchname])
    else params[:searchsurname] && params[:searchsurname].present?
      @people = Person.where(:surname => params[:searchsurname])
    # else
    #   @people = Person.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @people }
    end
  end
  # GET /people/1
  # GET /people/1.json
  def show
    @person = Person.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/new
  # GET /people/new.json
  def new
    @person = Person.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @person }
    end
  end

  # GET /people/1/edit
  def edit
    @person = Person.find(params[:id])
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(params[:person])

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render json: @person, status: :created, location: @person }

      else
        format.html { render action: "new" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.json
  def update
    @person = Person.find(params[:id])

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end

  def add_event
    @person = Person.find(params[:id])
  end

  def create_event
    @person = Person.find(params[:id])
    @person.events << Event.find(params[:event])
    @person.save
    redirect_to @person
  end



  private
  def check_if_logged_in
    redirect_to(login_path) if @auth.nil?
  end

  def check_if_admin
    redirect_to(root_path) if @auth.nil? || !@auth.is_admin?
  end

end
