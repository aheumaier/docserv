class PagesController < ApplicationController

  #before_filter :find_page, :except => [:new, :show, :create, :index]
  #before_filter :find_body, :only => [:edit]

  def new
    logger.info 'Logger: calling Page#new '
    @page = Page.new
  end

  # GET /pages
  # GET /pages.json
  def index
    logger.info 'Logger: calling Page#index '
    @pages = Page.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    logger.info 'Logger: calling Page#show '
    @page = Page.find_or_initialize_by_name(params[:id], commit: { name: 'system', email: 'sysop@mondiamedia.com', message: 'created page '+params[:id] })

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end


  def create
    logger.info 'Logger: calling Page#create '
    @page = Page.new(params[:page])
    if @page.save
      flash[:success] = "Successfully created page."
      redirect_to @page
    else
      render :action => 'new'
    end
  end

  def edit
    logger.info 'Logger: calling Page#edit '
    @page = Page.find(params[:id])
  end

  def update
    logger.info 'Logger: calling Page#update '
    @page = Page.find(params[:id])
    params[:page]['commit'] = { name: 'system', email: 'sysop@mondiamedia.com', message: 'Updated page '+params[:id] }
    if @page.update_attributes(params[:page])
      flash[:success] = "Successfully updated page."
      redirect_to @page
    else
      render :action => 'edit'
    end
  end

  def destroy
    @page.destroy
    flash[:notice] = "Successfully destroyed page."
  end

end
