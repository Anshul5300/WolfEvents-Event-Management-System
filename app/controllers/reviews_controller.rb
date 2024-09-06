class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]
  #before_action :set_event, only: [:create]
  #before_action :check_user_attendance, only: [:create]
  #before_action :check_event_category, only: [:create]
  before_action :auth_user, only: [:filter_reviews_by_params]


  # GET /reviews or /reviews.json
  def index
    @reviews = Review.all
    if current_user.role == "admin"
      if params[:user_name].present?
        user = User.find_by(name: params[:user_name])
        @reviews = @reviews.where(user_id: user.id) if user
      end

      if params[:event_name].present?
        event = Event.find_by(name: params[:event_name])
        @reviews = @reviews.where(event_id: event.id) if event
      end
    end
  end


  # GET /reviews/1 or /reviews/1.json
  def show
  end

  def by_user
    @reviews = Review.where(user_id: params[:user_id])
    render :index
  end

  def by_event
    @reviews = Review.where(event_id: params[:event_id])
    render :index
  end
  def auth_user
    #return if current_user.role == 'admin' # or whatever logic to authorize them
    #redirect_to events_path, notice: "Not Authorized" # fallback if not authorized
    #end
    if current_user==nil
      redirect_to new_user_session_path if current_user==nil
    else
      return if current_user.role == 'admin'
      redirect_to reviews_path, notice: "Not Authorized"
    end
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
    @review = Review.find(params[:id])
    if current_user.role != "admin" && current_user.id != @review.user_id
      redirect_to reviews_path, notice: "You are not authorized to edit this review."
    end
  end

  # POST /reviews or /reviews.json
  def create
    @review = current_user.reviews.build(review_params)
    #@review.user = current_user
    #@review.event = @event

    respond_to do |format|
      if @review.save
        format.html { redirect_to review_url(@review), notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to review_url(@review), notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review = Review.find(params[:id])
    if current_user.role != "admin" && current_user.id != @review.user_id
      redirect_to reviews_url, notice: "You are not authorized to delete this review."
    else
      @review.destroy!

      respond_to do |format|
        format.html { redirect_to reviews_url, notice: "Review was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  def filter_reviews_by_params
    user_name = params[:user_name].presence
    event_name = params[:event_name].presence

    Rails.logger.debug("User name parameter: #{user_name}")
    Rails.logger.debug("Event name parameter: #{event_name}")

    @reviews = Review.includes(:user, :event)

    @reviews = @reviews.where(users: { name: user_name }) if user_name.present?
    @reviews = @reviews.where(events: { name: event_name }) if event_name.present?

    Rails.logger.debug("Filtered reviews: #{@reviews.to_sql}")
  end
  def by_user_name
    user = User.find_by(user_name: params[:user_name])
    @reviews = user.reviews
    render :index
  end

  def by_event_name
    event = Event.find_by(event_name: params[:event_name])
    @reviews = event.reviews
    render :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

  def set_event
    @event = Event.find(params[:event_id])
  end

  #def check_user_attendance
  #  unless @event.tickets.exists?(user_id: current_user.id)
  #    redirect_to @event, alert: "You can only write reviews for events you have attended."
  # end
  #end

  #def check_event_category
  #  if ["Concerts", "Sports", "Arts & Theatre"].exclude?(@event.category)
  #    redirect_to reviews_path, notice: "You cannot write reviews for this category of events."
  #  end
  #end
    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:event_id, :rating, :feedback)
    end
end
