class McExportersController < ApplicationController
  # GET /mc_exporters
  # GET /mc_exporters.json
  def index
    @mc_exporters = McExporter.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mc_exporters }
    end
  end

  # GET /mc_exporters/1
  # GET /mc_exporters/1.json
  def show
    @mc_exporter = McExporter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mc_exporter }
    end
  end

  # GET /mc_exporters/new
  # GET /mc_exporters/new.json
  def new
    @mc_exporter = McExporter.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mc_exporter }
    end
  end

  # GET /mc_exporters/1/edit
  def edit
    @mc_exporter = McExporter.find(params[:id])
  end

  # POST /mc_exporters
  # POST /mc_exporters.json
  def create
    @mc_exporter = McExporter.new(params[:mc_exporter])

    respond_to do |format|
      if @mc_exporter.save
        format.html { redirect_to @mc_exporter, notice: 'Mc exporter was successfully created.' }
        format.json { render json: @mc_exporter, status: :created, location: @mc_exporter }
      else
        format.html { render action: "new" }
        format.json { render json: @mc_exporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mc_exporters/1
  # PUT /mc_exporters/1.json
  def update
    @mc_exporter = McExporter.find(params[:id])

    respond_to do |format|
      if @mc_exporter.update_attributes(params[:mc_exporter])
        format.html { redirect_to @mc_exporter, notice: 'Mc exporter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mc_exporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mc_exporters/1
  # DELETE /mc_exporters/1.json
  def destroy
    @mc_exporter = McExporter.find(params[:id])
    @mc_exporter.destroy

    respond_to do |format|
      format.html { redirect_to mc_exporters_url }
      format.json { head :no_content }
    end
  end
end
