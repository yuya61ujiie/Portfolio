class SpotsController < ApplicationController
  before_action :set_spot, only: %i[ show update destroy ]
  before_action :authenticate_user!, only: %i[ new create edit update destroy bookmarks ]

  def index
    if params[:tag_id]
      @spots = Tag.find(params[:tag_id]).spots.includes(:image_attachment, :tags).page(params[:page]).per(10)
    else
      @search_spots_form = SearchSpotsForm.new(search_params)
      @spots = @search_spots_form.search.page(params[:page]).per(10)
    end
  end

  def show
  end

  def new
    @spot = Spot.new
  end

  def edit
    @spot = current_user.spots.find(params[:id])
  end

  def create
    @spot = current_user.spots.build(spot_params)
    tag_list = params[:spot][:tag_ids].split(",")

    # スポット画像ない場合、デフォルト画像を表示
    unless @spot.image.attached?
      @spot.image.attach(
        io: File.open("app/assets/images/spot_default.webp"),
        filename: "spot_default.webp",
        content_type: "image/png",
      )
    end

    respond_to do |format|
      if @spot.save
        @spot.save_tags(tag_list)
        format.html { redirect_to @spot, notice: "スポットを登録しました" }
        format.json { render :show, status: :created, location: @spot }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @spot.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    tag_list = params[:spot][:tag_ids].split(",")

    respond_to do |format|
      if @spot.update(spot_params)
        @spot.save_tags(tag_list)
        format.html { redirect_to @spot, notice: "スポットを編集しました" }
        format.json { render :show, status: :ok, location: @spot }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @spot.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @spot.destroy!

    respond_to do |format|
      format.html { redirect_to spots_path, status: :see_other, notice: "スポットを削除しました" }
      format.json { head :no_content }
    end
  end

  def bookmarks
    @spots = current_user.bookmark_spots.all
  end

  def search
    @spots = Spot.where("spot_name like ?", "%#{params[:q]}%")
    @tags = Tag.where("name like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.js
    end
  end

  private
    def set_spot
      @spot = Spot.find(params[:id])
    end

    def spot_params
      params.require(:spot).permit(:spot_name, :category, :address, :body, :image).merge(user_id: current_user.id)
    end

    def search_params
      params[:q]&.permit(:spot_tag_name, :category, :address)
    end
end
