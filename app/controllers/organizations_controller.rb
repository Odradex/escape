class OrganizationsController < AuthorizedController
  before_action :set_organization, only: %i[show edit update destroy]

  def index
    authorize Organization
    @organizations = policy_scope(Organization.includes(:user))
    respond_to do |format|
      format.html
      format.json do
        logger.debug 'HIIIII'
        render json: OrganizationDatatable.new(params, organizations: @organizations, view_context: view_context)
      end
    end
  end

  def show
    authorize @organization
    @rooms_for_select = @organization.rooms.map { |room| { key: room.id, label: "Room #{room.number}" } }
  end

  def new
    @organization = Organization.new
    authorize @organization
  end

  def edit
    authorize @organization
  end

  def create
    @organization = User.find(organization_params[:user_id]).organizations.new(organization_params)
    authorize @organization
    if @organization.save
      redirect_to @organization, notice: 'Organization was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    authorize @organization
    if @organization.update(organization_params)
      redirect_to @organization, notice: 'Organization was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @organization
    @organization.destroy
    redirect_to organizations_url, notice: 'Organization was successfully destroyed.'
  end

  private

  def set_organization
    @organization = Organization.find(params[:id])
  end

  def organization_params
    params.require(:organization).permit(:name, :user_id, :adress, :opening_time, :closing_time)
  end
end
