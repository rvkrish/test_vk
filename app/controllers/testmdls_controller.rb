class TestmdlsController < ApplicationController
  before_action :set_testmdl, only: [:show, :edit, :update, :destroy]

  # GET /testmdls
  # GET /testmdls.json
  def index
    @testmdls = Testmdl.all
  end

  # GET /testmdls/1
  # GET /testmdls/1.json
  def show
  end

  # GET /testmdls/new
  def new
    @testmdl = Testmdl.new
  end

  # GET /testmdls/1/edit
  def edit
  end

  # POST /testmdls
  # POST /testmdls.json
  def create
    @testmdl = Testmdl.new(testmdl_params)

    respond_to do |format|
      if @testmdl.save
        format.html { redirect_to @testmdl, notice: 'Testmdl was successfully created.' }
        format.json { render :show, status: :created, location: @testmdl }
      else
        format.html { render :new }
        format.json { render json: @testmdl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /testmdls/1
  # PATCH/PUT /testmdls/1.json
  def update
    respond_to do |format|
      if @testmdl.update(testmdl_params)
        format.html { redirect_to @testmdl, notice: 'Testmdl was successfully updated.' }
        format.json { render :show, status: :ok, location: @testmdl }
      else
        format.html { render :edit }
        format.json { render json: @testmdl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testmdls/1
  # DELETE /testmdls/1.json
  def destroy
    @testmdl.destroy
    respond_to do |format|
      format.html { redirect_to testmdls_url, notice: 'Testmdl was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testmdl
      @testmdl = Testmdl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def testmdl_params
      params.require(:testmdl).permit(:tst)
    end
end
