class DecimalsController < ApplicationController
  before_action :set_decimal, only: [:show, :edit, :update, :destroy]

  # GET /decimals
  # GET /decimals.json
  def index
    @decimals = Decimal.all
  end

  # GET /decimals/1
  # GET /decimals/1.json
  def show
  end

  # GET /decimals/new
  def new
    @decimal = Decimal.new
  end

  # GET /decimals/1/edit
  def edit
  end

  # POST /decimals
  # POST /decimals.json
  def create
    @decimal = Decimal.new(decimal_params)

    @decimal.ip = NetAddr.i_to_ip(@decimal.number)

    respond_to do |format|
      if @decimal.save
        format.html { redirect_to @decimal, notice: 'Decimal was successfully created.' }
        format.json { render :show, status: :created, location: @decimal }
      else
        format.html { render :new }
        format.json { render json: @decimal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /decimals/1
  # PATCH/PUT /decimals/1.json
  def update
    @decimal = Decimal.find(params[:id])
    @decimal.ip = NetAddr.i_to_ip(@decimal.number)
    respond_to do |format|
      if @decimal.update(decimal_params)
        format.html { redirect_to @decimal, notice: 'Decimal was successfully updated.' }
        format.json { render :show, status: :ok, location: @decimal }
      else
        format.html { render :edit }
        format.json { render json: @decimal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decimals/1
  # DELETE /decimals/1.json
  def destroy
    @decimal.destroy
    respond_to do |format|
      format.html { redirect_to decimals_url, notice: 'Decimal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_decimal
      @decimal = Decimal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def decimal_params
      params.require(:decimal).permit(:number, :ip)
    end
end
