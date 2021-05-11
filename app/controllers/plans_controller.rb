class PlansController < ApplicationController
  before_action :set_plan, only: %i[ show update destroy ]

  # GET /plans
  # GET /plans.json
  def index
    @plans = Plan.all
  end

  # GET /plans/1
  # GET /plans/1.json
  def show
  end

  # POST /plans
  # POST /plans.json
  def create
    @plan = Plan.new(plan_params)

    if @plan.save
      render :show, status: :created, location: @plan
    else
      render json: @plan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /plans/1
  # PATCH/PUT /plans/1.json
  def update
    if @plan.update(plan_params)
      render :show, status: :ok, location: @plan
    else
      render json: @plan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @plan.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plan_params
      params.require(:plan).permit(:room, :area)
    end
end
