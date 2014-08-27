class NodesController < ApplicationController
  # GET /nodes
  # GET /nodes.json
  def index
    @nodes = Node.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nodes }
    end
  end

  # GET /nodes/1
  # GET /nodes/1.json
  def show
    @node = Node.find(params[:id].gsub('_', '.'))
    @node_facts = @node.facts
    @node_artifact_id = @node.artifact_id
    @page = Page.find_or_initialize_by_name(@node_artifact_id, commit: { name: 'system', email: 'sysop@mondiamedia.com', message: 'created page '+@node_artifact_id })

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @node }
    end
  end
end
