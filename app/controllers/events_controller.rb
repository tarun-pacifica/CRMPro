layout 'org_peo_cal'
class EventsController < ApplicationController
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
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end
# GET /people/1
  # GET /people/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /people/new
  # GET /people/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /people/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /people
  # POST /people.json
  def create
    @event = Event.new(params[:event])

    cal = Google::Calendar.new(:username => 'crmprohorse@gmail.com',
                           :password => '$$billsya',
                           :app_name => 'crmprohorse.com-googlecalendar-integration')

event = cal.create_event do |e|
  e.title = params[:event][:eventtype]
  e.start_time = @event.startdate #params[:event][:startdate].to_s
  e.end_time = @event.enddate #params[:event][:startdate].to_s  # seconds * min
end

# puts event

# event = cal.find_or_create_event_by_id(event.id) do |e|
#   e.title = params[:eventtype]
#   e.end_time = params[:startdate] + (60 * 60 * 2) # seconds * min * hours
# end

# puts event

# # All events
# puts cal.events

# # Query events
# puts cal.find_events('my search string')

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @event = Event.find(params[:id])

    if @auth.is_admin?
      @event.destroy
      redirect_to events_path
    else
      redirect_to events_path
    end

  end
end

