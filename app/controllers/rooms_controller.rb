class RoomsController < AuthorizedController
  before_action :set_room, only: %i[show edit update destroy]
  
  def index
    authorize Room
    respond_to do |format|
      format.html
      format.json do
        render json: RoomDatatable.new(params, view_context: view_context)
      end
    end
  end

  def show
    authorize @room
    respond_to do |format|
      format.html
      format.json do
        render json: @room
      end
    end
  end

  def new
    @room = Room.new(organization_id: params[:organization_id])
    authorize @room
  end

  def edit
    authorize @room
  end

  def create
    @room = Room.new(room_params)
    authorize @room

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @room
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @room
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:organization_id, :number, :size, :capacity, :hourly_payment)
  end
end
