# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    @reservations = current_user.reservations.order(created_at: :desc) if current_user
  end

  def help; end
end
