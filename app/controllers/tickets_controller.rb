class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy ]
  #before_action :auth_user, only: [:edit, :update]

  # GET /tickets or /tickets.json
  def index
    if current_user.role == "admin"
      @tickets = Ticket.all
    else
      @tickets = Ticket.where(user_id: current_user.id)
    end
  end

  # GET /tickets/1 or /tickets/1.json
  def show
    @event = @ticket.event
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets or /tickets.json
  def create
    @ticket = current_user.tickets.build(ticket_params)
    @ticket.confirmation_number = SecureRandom.hex(10)
    event = Event.find(params[:ticket][:event_id])
    @ticket.total_cost = event.price * @ticket.quantity
    respond_to do |format|
      if @ticket.save
        event.seats_left -= @ticket.quantity
        event.save
        format.html { redirect_to ticket_url(@ticket), notice: "Ticket was successfully created." }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update
    old_quantity = @ticket.quantity
    respond_to do |format|
      if @ticket.update(ticket_params)
        event = Event.find(@ticket.event_id)
        difference = old_quantity - @ticket.quantity
        event.seats_left += difference
        event.save
        format.html { redirect_to ticket_url(@ticket), notice: "Ticket was successfully updated." }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1 or /tickets/1.json
  def destroy
    @ticket.destroy!
    event = Event.find(@ticket.event_id)
    event.seats_left += @ticket.quantity
    event.save
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: "Ticket was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

  def auth_user
    unless current_user.role == 'admin'
      redirect_to tickets_path, notice: "Not Authorized"
    end
  end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:event_id, :room_id, :confirmation_number, :quantity)
    end
end
