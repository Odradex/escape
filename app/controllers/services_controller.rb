class ServicesController < AuthorizedController
  before_action :set_service, only: %i[show edit update destroy]

  def index
    authorize Service
    respond_to do |format|
      format.html
      format.json do
        logger.debug("services_controller.rb: #{params.inspect}")
        render json: ServiceDatatable.new(params, view_context: view_context)
      end
    end
  end

  def show
    authorize @service
  end

  def new
    @service = Service.new
    authorize @service
  end

  def edit
    authorize @service
  end

  def create
    authorize Service
    @service = Service.new(service_params)
    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @service
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @service
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def total_price
    render json: Service.where(id: params[:service_ids]).sum(:price)
    authorize Service
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name, :category, :price)
  end
end
