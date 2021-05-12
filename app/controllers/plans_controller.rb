class PlansController < ApplicationController
  before_action :set_enterprise
  before_action :set_plan, only: %i[show update destroy upload]

  # GET /plans
  # GET /plans.json
  def index
    @plans = @enterprise.plans
    filter_by_query if params[:q].present?
  end

  # GET /plans/1
  # GET /plans/1.json
  def show; end

  # POST /plans
  # POST /plans.json
  def create
    @plan = @enterprise.plans.new(plan_params)

    if @plan.save
      render :show, status: :created, location: enterprise_plan_url(@enterprise, @plan)
    else
      render json: @plan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /plans/1
  # PATCH/PUT /plans/1.json
  def update
    if @plan.update(plan_params)
      render :show, status: :ok, location: enterprise_plan_url(@enterprise, @plan)
    else
      render json: @plan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.json
  def destroy
    @plan.destroy
  end

  def upload
    @plan.image.attach(params[:image])

    render :show, status: :ok, location: enterprise_plan_url(@enterprise, @plan)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_plan
    id = params[:id] || params[:plan_id]
    @plan = @enterprise.plans.find(id)
  end

  def set_enterprise
    @enterprise = Enterprise.find(params[:enterprise_id])
  end

  # Only allow a list of trusted parameters through.
  def plan_params
    params.require(:plan).permit(:room, :area, :enterprise_id)
  end

  def filter_by_query
    @plans = @plans
             .ransack(room_or_area_cont: params[:q])
             .result
  end
end
