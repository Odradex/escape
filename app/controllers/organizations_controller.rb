class OrganizationsController < ApplicationController
  before_action :set_organization, only: %i[show edit update destroy]

  def index
    @organizations = if current_user.admin?
                       Organization.all
                     else
                       Organization.where(user: current_user)
                     end
  end

  def show; end

  def new
    @organization = Organization.new
  end

  def edit; end

  def create
    @organization = User.find(organization_params[:user_id]).organizations.new(organization_params)
    if @organization.save
      redirect_to @organization, notice: 'Organization was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @organization.update(organization_params)
      redirect_to @organization, notice: 'Organization was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
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
