class ReservationsController < AuthorizedController
  before_action :set_reservation, only: %i[show edit update destroy]

  def index
    @reservations = Reservation.all
    authorize @reservations
    respond_to do |format|
      format.json do
        render json: ReservationDatatable.new(params, view_context: view_context)
      end
    end
  end

  def show
    authorize @reservation
  end

  def new
    @reservation = Reservation.new
    @organization = Room.find(params[:room_id]).organization
    authorize @reservation
  end

  def edit
    @organization = @reservation.room.organization
    authorize @reservation
  end

  def create
    @reservation = Reservation.new(reservation_params)
    authorize @reservation

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @reservation
    @organization = @reservation.room.organization
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:user_id, :room_id, :start_time, :end_time)
  end
end
