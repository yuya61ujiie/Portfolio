class SpotsController < ApplicationController
  before_action :set_spot, only: %i[ show update destroy ]
  before_action :authenticate_user!, only: %i[ new create edit update destroy ]

  # GET /spots or /spots.json
  def index
    @spots = Spot.all
  end

  # GET /spots/1 or /spots/1.json
  def show
  end

  # GET /spots/new
  def new
    @spot = Spot.new
  end

  # GET /spots/1/edit
  def edit
    @spot = current_user.spots.find(params[:id])
  end

  # POST /spots or /spots.json
  def create
    @spot = current_user.spots.build(spot_params)

    unless @spot.image.attached?
      @spot.image.attach(
        io: File.open("app/assets/images/spot_default.png"),
        filename: "spot_default.png",
        content_type: "image/png",
      )
    end

    respond_to do |format|
      if @spot.save
        format.html { redirect_to @spot, notice: "スポットを登録しました" }
        format.json { render :show, status: :created, location: @spot }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spots/1 or /spots/1.json
  def update
    respond_to do |format|
      if @spot.update(spot_params)
        format.html { redirect_to @spot, notice: "スポットを編集しました" }
        format.json { render :show, status: :ok, location: @spot }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @spot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spots/1 or /spots/1.json
  def destroy
    @spot.destroy!

    respond_to do |format|
      format.html { redirect_to spots_path, status: :see_other, notice: "スポットを削除しました" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spot
      @spot = Spot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spot_params
      params.require(:spot).permit(:spot_name, :category, :address, :body, :image).merge(user_id: current_user.id)
    end
end
