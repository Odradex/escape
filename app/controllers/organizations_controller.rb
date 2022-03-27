class OrganizationsController < AuthorizedController
  require 'axlsx'
  before_action :set_organization, only: %i[show edit update destroy]

  def index
    authorize Organization
    @organizations = policy_scope(Organization.includes(:user))
    gon.markers = @organizations.map do |organization|
      {
        name: organization.name,
        opening_time: organization.opening_time.strftime('%H:%M'),
        closing_time: organization.closing_time.strftime('%H:%M'),
        lat: organization.lat.to_f,
        lng: organization.lon.to_f
      }
    end
    respond_to do |format|
      format.html
      format.json do
        render json: OrganizationDatatable.new(params, organizations: @organizations, view_context: view_context)
      end
      format.xlsx do
        xlsx_package = Organization.to_xlsx
        temp = Tempfile.new("organizations.xlsx")
        xlsx_package.serialize temp.path
        send_file temp.path, filename: "organizations.xlsx"
      end
    end
  end

  def rooms
    authorize Organization
    render json: Organization.find(params[:id]).rooms
  end

  def show
    gon.calendar_events_path = calendar_events_path(organization_id: @organization.id)
    authorize @organization
  end

  def new
    @organization = Organization.new
    authorize @organization
  end

  def edit
    authorize @organization
  end

  def report
    authorize Organization
    p = Axlsx::Package.new
    wb = p.workbook

    wb.add_worksheet(name: 'Basic Worksheet') do |sheet|
      sheet.add_row ['First', 'Second', 'Third']
      sheet.add_row [1, 2, 3]
    end

    p.serialize 'basic_example.xlsx'
    send_file 'basic_example.xlsx'
  end

  def create
    @organization = User.find(organization_params[:user_id]).organizations.new(organization_params)
    authorize @organization
    search_result = Geocoder.search(@organization.adress)&.first&.data
    @organization.lat = search_result['lat'] || 0
    @organization.lon = search_result['lon'] || 0
    if @organization.save
      redirect_to @organization, notice: 'Организация успешно создана.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @organization
    if @organization.update(organization_params)
      redirect_to @organization, notice: 'Организация успешно обновлена.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @organization
    @organization.destroy
    redirect_to organizations_url, notice: 'Организация успешно удалена.'
  end

  private

  def set_organization
    @organization = Organization.find(params[:id])
  end

  def organization_params
    params.require(:organization).permit(:name, :user_id, :adress, :opening_time, :closing_time)
  end
end
