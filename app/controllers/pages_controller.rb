class PagesController < ApplicationController

  #before_filter :find_page, :except => [:new, :show, :create, :index]
  #before_filter :find_body, :only => [:edit]

  def new
    @page = Page.new
  end

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pages }
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @page = Page.find_or_initialize_by_name(params[:id], commit: { name: 'system', email: 'sysop@mondiamedia.com', message: 'created page '+params[:id] })

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @page }
    end
  end


  def create
    @page = Page.new(params[:page])
    if @page.save
      flash[:notice] = "Successfully created page."
      redirect_to @page
    else
      render :action => 'new'
    end
  end

  def edit
    @page = Page.find(params[:id])


  end

  def update
    if @page.update_attributes(params[:page])
      flash[:notice] = "Successfully updated page."
      redirect_to @page
    else
      render :action => 'edit'
    end
  end

  def destroy
    @page.destroy
    flash[:notice] = "Successfully destroyed page."
  end

  def preview
    render :text => @page.preview(params[:data])
  end

  private

  def find_page
    @page = Page.find(params[:id])
  end

  def find_body
    @page.body = params[:page][:body] rescue @page
  end

end
