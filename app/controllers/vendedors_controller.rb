class VendedorsController < ApplicationController
  before_action :set_vendedor, only: %i[ show update destroy ]

  # GET /vendedors
  def index
    @vendedors = Vendedor.all

    render json: @vendedors
  end

  # GET /vendedors/1
  def show
    render json: @vendedor
  end

  # POST /vendedors
  def create
    @vendedor = Vendedor.new(vendedor_params)

    if @vendedor.save
      render json: @vendedor, status: :created, location: @vendedor
    else
      render json: @vendedor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vendedors/1
  def update
    if @vendedor.update(vendedor_params)
      render json: @vendedor
    else
      render json: @vendedor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vendedors/1
  def destroy
    @vendedor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendedor
      @vendedor = Vendedor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vendedor_params
      params.require(:vendedor).permit(:number, :nombre, :email, :oficina, :manager)
    end
end
