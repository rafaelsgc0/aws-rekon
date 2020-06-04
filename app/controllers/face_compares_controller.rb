class FaceComparesController < ApplicationController
  include CompareFaces
  before_action :set_face_compare, only: [:show, :edit, :update, :destroy]

  # GET /face_compares
  # GET /face_compares.json
  def index
    @face_compares = FaceCompare.all
  end

  # GET /face_compares/1
  # GET /face_compares/1.json
  def show
  end

  # GET /face_compares/new
  def new
    @face_compare = FaceCompare.new
  end

  # GET /face_compares/1/edit
  def edit
  end

  # POST /face_compares
  # POST /face_compares.json
  def create
    @face_compare = FaceCompare.new(face_compare_params)

    respond_to do |format|
      if @face_compare.save
        result = RekonService.new(@face_compare.profile).compare_faces(@face_compare)
        @face_compare.update(result: result[:face_matches].to_json)
        format.html { redirect_to @face_compare, notice: 'Face compare was successfully created.' }
        format.json { render :show, status: :created, location: @face_compare }
      else
        format.html { render :new }
        format.json { render json: @face_compare.errors, status: :unprocessable_entity }
      end
    end
  end





  # PATCH/PUT /face_compares/1
  # PATCH/PUT /face_compares/1.json
  def update
    respond_to do |format|
      if @face_compare.update(face_compare_params)
        format.html { redirect_to @face_compare, notice: 'Face compare was successfully updated.' }
        format.json { render :show, status: :ok, location: @face_compare }
      else
        format.html { render :edit }
        format.json { render json: @face_compare.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /face_compares/1
  # DELETE /face_compares/1.json
  def destroy
    @face_compare.destroy
    respond_to do |format|
      format.html { redirect_to face_compares_url, notice: 'Face compare was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_face_compare
      @face_compare = FaceCompare.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def face_compare_params
      params.require(:face_compare).permit(:profile_id, :photo_compare, :result)
    end
end
