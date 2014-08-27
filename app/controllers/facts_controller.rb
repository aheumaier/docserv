class FactsController < ApplicationController
  # GET /facts
  # GET /facts.json
  def index
    @facts = Fact.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @facts }
    end
  end

  # GET /facts/1
  # GET /facts/1.json
  def show
    @fact = Fact.find(params[:id].gsub('.', '_'))

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fact }
    end
  end
end
