class BadgesController < ApplicationController
    before_action :set_badge, only: [:show, :update, :destroy]

  def index
    @badges = Badge.where(student_id: params[:student_id])
    render json: @badges
  end

  def create
    @badge = Badge.new(badge_params)
    @badge.student_id = params[:student_id]
    if @badge.save
      render json: @badge, status: :created
    else
      err
    end
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.permit(:text)
  end

  def err
    render json: @badge.errors, status: :unprocessable_entity
  end
end
