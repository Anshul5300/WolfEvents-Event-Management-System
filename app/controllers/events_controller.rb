class EventsController < ApplicationController
  before_action :set_event, only: %i[ show edit update destroy ]
  before_action :auth_user, only: [ :new, :destroy, :edit ]
  # before_action :auth_destroy, only: [ :destroy ]

  # GET /events or /events.json
  def index
    if current_user.role == "admin"
      @events = Event.all
    else
      @events = Event.upcoming.select { |event| event.seats_left > 0 }
    end

    @events = @events.where("name LIKE ?", "%#{params[:search]}%") if params[:search].present?

    filter_events_by_params if params[:category].present? || params[:date].present? || params[:price_range].present?
  end

  # GET /events/1 or /events/1.json
  def show
    @event = Event.find(params[:id])
    respond_to do |format|
      format.json { render json: @event }
    end
  end

  def filter_events_by_params
    category = params[:category].presence
    date = params[:date].presence
    min_price, max_price = nil, nil

    if params[:price_range] != "All"
      min_price, max_price = params[:price_range].presence&.split("-")&.map(&:to_f)
    end

    @events = @events.where(category: category) if category.present? && category != "All"
    @events = @events.where("date >= ?", date) if date.present?
    @events = @events.where(price: min_price..max_price) if min_price && max_price
  end

  def auth_user
    #return if current_user.role == 'admin' # or whatever logic to authorize them
    #redirect_to events_path, notice: "Not Authorized" # fallback if not authorized
    #end
    if current_user==nil
      redirect_to new_user_session_path if current_user==nil
    else
      return if current_user.role == 'admin'
      redirect_to events_path, notice: "Not Authorized"
    end
  end
  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.start_time >= @event.end_time
        format.html { redirect_to new_event_path, notice: "End time cannot be greater than Start Time" }
      elsif @event.save
        format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy!

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :category, :date, :start_time, :end_time, :price, :seats_left, :room_id)
    end
end
