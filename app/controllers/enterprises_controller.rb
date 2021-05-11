class EnterprisesController < ApplicationController
  before_action :set_enterprise, only: %i[show update destroy upload]

  # GET /enterprises
  # GET /enterprises.json
  def index
    @enterprises = Enterprise.all
    filter_by_query if params[:q]
  end

  # GET /enterprises/1
  # GET /enterprises/1.json
  def show; end

  # POST /enterprises
  # POST /enterprises.json
  def create
    @enterprise = Enterprise.new(enterprise_params)

    if @enterprise.save
      render :show, status: :created, location: @enterprise
    else
      render json: @enterprise.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /enterprises/1
  # PATCH/PUT /enterprises/1.json
  def update
    if @enterprise.update(enterprise_params)
      render :show, status: :ok, location: @enterprise
    else
      render json: @enterprise.errors, status: :unprocessable_entity
    end
  end

  def upload
    @enterprise.image.attach(params[:image])
    render :show, status: :created, location: @enterprise
  end

  # DELETE /enterprises/1
  # DELETE /enterprises/1.json
  def destroy
    @enterprise.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_enterprise
    id = params[:id] || params[:enterprise_id]
    @enterprise = Enterprise.find(id)
  end

  # Only allow a list of trusted parameters through.
  def enterprise_params
    params.require(:enterprise).permit(:nome, :endereco)
  end

  def filter_by_query
    @enterprises = @enterprises
                   .ransack(nome_or_endereco_cont: params[:q])
                   .result
  end
end
